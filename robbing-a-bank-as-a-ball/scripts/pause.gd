extends CanvasLayer

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("pauses"):
		get_viewport().set_input_as_handled()
		if get_tree().paused:
			visible = false
			get_tree().paused = false

func _on_main_menu_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
	get_viewport().set_input_as_handled()


func _on_continue_button_down() -> void:
	get_viewport().set_input_as_handled()
	if get_tree().paused:
		
		visible = false
		get_tree().paused = false
		get_viewport().set_input_as_handled()



func _on_restart_button_down() -> void:
	get_tree().paused = false
	if Global.stageNum == 1:
		get_tree().change_scene_to_file("res://scenes/stage_1.tscn")
		Global.tries -= 1
		
	else:
		get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
	


func _on_settings_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
	
