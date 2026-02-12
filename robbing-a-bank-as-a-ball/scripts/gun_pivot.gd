extends Node2D
const bulletPrefab = preload("res://scenes/bullet.tscn")

var player
var canShoot = true
var degrees
var burstShot: int = 2
var reloading: bool = false

func _ready() -> void:
	player = get_parent()
func _process(delta: float) -> void:
	
	print(burstShot)
	print(canShoot)
	degrees = atan2(get_global_mouse_position().y - $"..".position.y, get_global_mouse_position().x - $"..".position.x)
	$".".rotation =  degrees
	if (abs(rad_to_deg(degrees)) < 270) && (abs(rad_to_deg(degrees)) > 90):
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_v = false
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and canShoot and burstShot > 0:
		for i in range(15):
			var bullet = bulletPrefab.instantiate()
			bullet.position = player.position
			player.get_parent().add_child(bullet)
			bullet.rotation = deg_to_rad((i*2) +rad_to_deg(degrees)-10)
		$"../shootTimer".start()
		burstShot -= 1
		canShoot = false
	if burstShot < 1 and !reloading:
		reloading = true
		$"../reloadTime".start()
		


func _on_shoot_timer_timeout() -> void:
	canShoot = true


func _on_reload_time_timeout() -> void:
	burstShot = 2
	canShoot = true
	reloading = false
