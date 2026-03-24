extends CharacterBody2D

const blood = preload("res://scenes/dies_of_death.tscn")
const bullet = preload("res://scenes/enemy_bullets.tscn")
enum state {idle, attacking}
var gun: Node2D
var player: CharacterBody2D
var playerPosition: Vector2
var direction: float
var CurrentState

var isDying = false
@export var HP: int = 3

@export var shoot: AudioStream
@export var death_audio: AudioStream

func _ready() -> void:
	CurrentState = state.idle
	gun =  $gun
	player = get_parent().find_child("player")
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move_and_slide()
func _process(_delta: float) -> void:
	playerPosition = player.position
	direction = atan2(playerPosition.y - position.y, playerPosition.x - position.x) 
	gun.rotation = direction
	if (abs(rad_to_deg(direction)) < 270) && (abs(rad_to_deg(direction)) > 90):
		gun.find_child("Sprite2D").flip_v = true
	else:
		gun.find_child("Sprite2D").flip_v = false
	if HP <= 0 and !isDying:
		Global.kills += 1
		AudioManager.play_oneshot(death_audio, 10)
		var bloodExplosion = blood.instantiate()
		bloodExplosion.position = position
		get_parent().add_child(bloodExplosion)
		isDying = true
		queue_free()

	
		


func _on_shoot_time_timeout() -> void:
	AudioManager.play_oneshot(shoot)
	var newBullet = bullet.instantiate()
	newBullet.add_to_group("enemy")
	newBullet.position = position
	newBullet.rotation = direction
	get_parent().add_child(newBullet)


func _on_view_sight_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		CurrentState = state.attacking
		$shootTime.start()


func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		HP -= area.damage


func _on_view_sight_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		CurrentState = state.idle
		$shootTime.stop()
