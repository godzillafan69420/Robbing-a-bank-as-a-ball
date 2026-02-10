extends Node2D
var degrees
func _process(delta: float) -> void:
	degrees = atan2(get_global_mouse_position().y - $"..".position.y, get_global_mouse_position().x - $"..".position.x)
	$".".rotation =  degrees
	if (abs(rad_to_deg(degrees)) < 270) && (abs(rad_to_deg(degrees)) > 90):
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_v = false
