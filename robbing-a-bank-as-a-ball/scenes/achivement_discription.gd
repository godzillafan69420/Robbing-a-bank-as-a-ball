extends Panel

func _ready() -> void:
	visible = false
func _process(delta: float) -> void:
	position = get_viewport().get_mouse_position()
