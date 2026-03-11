extends Area2D
@export var loadingAnimation: Control
@export var sceneToChange: int




func _on_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("player"):

		if sceneToChange == 0:
			
			get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
		if sceneToChange == 1:
			
			get_tree().change_scene_to_file("res://scenes/winScreen.tscn")
