extends Area2D
@export var loadingAnimation: Control
@export var sceneToChange: int




func _on_body_entered(body: Node2D) -> void:
	
	if body.is_in_group("player"):
		if Global.kills == 0:
			Global.pacifist = true
		if Global.kills == 58:
			Global.death = true
		if sceneToChange == 0:
		
			Global.beattutorial = true
			get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
			
		if sceneToChange == 1:
			if Global.kills == 0:
				Global.pacifist = true
			if Global.STAGE1time < 45:
				Global.beatPersonal = true
			
			Global.beatlevel = true
			
			get_tree().change_scene_to_file("res://scenes/you_won.tscn")
		Global.kills = 0
