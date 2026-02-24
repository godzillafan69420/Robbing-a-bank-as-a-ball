extends CharacterBody2D

var gun: Node2D
var player: CharacterBody2D
var playerPosition: Vector2
var direction: float
func _ready() -> void:
	gun =  $gun
	player = get_parent().find_child("player")
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity = get_gravity() * delta
	move_and_slide()
func _process(delta: float) -> void:
	playerPosition = player.position
	direction = atan2(playerPosition.y - position.y, playerPosition.x - position.x) 
	gun.rotation = direction
	if (abs(rad_to_deg(direction)) < 270) && (abs(rad_to_deg(direction)) > 90):
		gun.find_child("Sprite2D").flip_v = true
	else:
		gun.find_child("Sprite2D").flip_v = false
