extends Area2D

enum state {idle, attacking}
var CurrentStates
var playerPosition: Vector2
var direction: Vector2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CurrentStates = state.idle


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if CurrentStates ==state.idle:
		$Spikes.animation = "idle"
	if CurrentStates ==state.attacking:
		$Spikes.animation = "angry"
		direction = playerPosition - position
		position += direction.normalized() * 400


func _on_playerdector_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player"):
		CurrentStates = state.attacking
		playerPosition = body.position
