extends Area2D

@export var scene: PackedScene
const detectionDistance: float = 200
var player: CharacterBody2D
var playerDistance: float 
var playerVec: Vector2

func _ready() -> void:
	player= get_parent().find_child("player")
	
func _process(delta: float) -> void:
	if player == null:
		return
	playerVec = player.position - position
	playerDistance = sqrt(pow(playerVec.x, 2) + pow(playerVec.y, 2))
	if playerDistance < detectionDistance:
		$AnimatedSprite2D.animation = "active"
	else:
		$AnimatedSprite2D.animation = "idle"


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("changing Scenes")
		get_tree().change_scene_to_packed(scene)
