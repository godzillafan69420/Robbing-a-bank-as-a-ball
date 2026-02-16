extends Area2D

enum state {idle, attacking}
var CurrentStates
var playerPosition: Vector2
var direction: Vector2
var HP: float = 5
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CurrentStates = state.idle


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	playerPosition = $".".get_parent().find_child("player").position
	if CurrentStates ==state.idle:
		$Spikes.animation = "idle"
	if CurrentStates ==state.attacking:
		$Spikes.animation = "angry"
		direction = playerPosition - position
		position += direction.normalized() * 100 * delta
		rotation = atan2(direction.y, direction.x) + PI/2
	if HP <= 0:
		queue_free()

func _on_playerdector_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		CurrentStates = state.attacking
		


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		HP -= 1
		area.queue_free()
	
