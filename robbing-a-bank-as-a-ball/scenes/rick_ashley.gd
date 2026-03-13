extends Area2D

enum state {idle, attacking}
var CurrentStates
var playerPosition: Vector2
var direction: Vector2
var HP: float = 1000000
var player: CharacterBody2D
@export var death_audio: AudioStream
@export var active: AudioStream
@export var active1: AudioStream
@export var active2: AudioStream
@export var active3: AudioStream
@export var active4: AudioStream
var sfx: int 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent().get_node("player")
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	playerPosition = player.position

	direction = playerPosition - position
	position += direction.normalized() * 450 * delta
	if HP <= 0:
		AudioManager.play_oneshot(death_audio, 10)
		queue_free()

		


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		
		HP -= area.damage
	

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_timer_timeout() -> void:
	AudioManager.play_oneshot(death_audio)
