extends Area2D

@export var sceneToChange: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if sceneToChange == 0:
			get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
		if sceneToChange == 1:
			get_tree().change_scene_to_file("res://scenes/winScreen.tscn")
