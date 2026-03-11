extends Node2D




var player
var canShoot = true
var degrees
var burstShot: int = 2
var reloading: bool = false
var UIBulletP: Label
func _ready() -> void:

	player = get_parent()
	UIBulletP = player.get_node("UI/bulletAmont")
func _process(_delta: float) -> void:
	degrees = atan2(get_global_mouse_position().y - $"..".position.y, get_global_mouse_position().x - $"..".position.x)
	$".".rotation =  degrees
	if (abs(rad_to_deg(degrees)) < 270) && (abs(rad_to_deg(degrees)) > 90):
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_v = false
	
	
		
