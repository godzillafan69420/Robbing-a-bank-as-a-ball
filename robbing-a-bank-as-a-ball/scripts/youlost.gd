extends CanvasLayer

func _ready() -> void:
	AudioManager.play("death")

func _on_button_button_down() -> void:
	if Global.stageNum == 1:
		Global.tries -= 1
	Global.STAGE1time = 0
	
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
	
