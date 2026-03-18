extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("WinScene")


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/winScreen.tscn")
