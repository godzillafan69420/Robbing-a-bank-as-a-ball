extends Node2D
const bulletPrefab = preload("res://scenes/bullet.tscn")

var player
var canShoot = true
var degrees

func _ready() -> void:
	player = get_parent()
func _process(delta: float) -> void:
	degrees = atan2(get_global_mouse_position().y - $"..".position.y, get_global_mouse_position().x - $"..".position.x)
	$".".rotation =  degrees
	if (abs(rad_to_deg(degrees)) < 270) && (abs(rad_to_deg(degrees)) > 90):
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_v = false
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && canShoot:
		for i in range(15):
			var bullet = bulletPrefab.instantiate()
			bullet.position = player.position
			player.get_parent().add_child(bullet)
			bullet.rotation = deg_to_rad((i*2) +rad_to_deg(degrees)-10)
		canShoot = false
		$"../shootTimer".start()
		


func _on_shoot_timer_timeout() -> void:
	canShoot = true
