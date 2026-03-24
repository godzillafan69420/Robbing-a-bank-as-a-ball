extends Area2D

const blood = preload("res://scenes/dies_of_death.tscn")
enum state {idle, attacking}
var canAttack: bool = true
var CurrentStates
var playerPosition: Vector2
var direction: Vector2
var HP: float = 2
@export var death_audio: AudioStream
@export var active: AudioStream
@export var active1: AudioStream
@export var active2: AudioStream
@export var active3: AudioStream
@export var active4: AudioStream
var sfx: int 

var isDying = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	CurrentStates = state.idle
	sfx = randi() % 4


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
	if HP <= 0 and !isDying:
		Global.kills += 1
		AudioManager.play_oneshot(death_audio, 10)
		var bloodExplosion = blood.instantiate()
		bloodExplosion.position = position
		get_parent().add_child(bloodExplosion)
		isDying = true
		queue_free()

func _on_playerdector_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("player") and CurrentStates != state.attacking:
		if sfx ==0:
			AudioManager.play_oneshot(active)
		if sfx ==1:
			AudioManager.play_oneshot(active2)
		if sfx ==2:
			AudioManager.play_oneshot(active3)
		if sfx ==3:
			AudioManager.play_oneshot(active4)
		CurrentStates = state.attacking
		


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		HP -= area.damage


	


		
	
