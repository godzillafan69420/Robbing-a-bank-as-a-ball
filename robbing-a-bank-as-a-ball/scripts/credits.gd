extends CanvasLayer

func fraudDetector():
	Global.fraudDetector = true
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")

func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


func _on_right_button_down() -> void:
	fraudDetector()


func _on_also_right_button_down() -> void:
	fraudDetector()
