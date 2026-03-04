extends CanvasLayer

func _ready() -> void:
	AudioManger.stop_all()
	AudioManger.play("res://music/death.mp3")

func _on_button_button_down() -> void:
	Global.STAGE1time = 0
	Global.tries -= 1
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
	
