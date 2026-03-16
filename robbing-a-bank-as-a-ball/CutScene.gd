extends Node2D

signal  done
func _ready() -> void:
	$AnimationPlayer.play("PleaseBarry")




func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")
