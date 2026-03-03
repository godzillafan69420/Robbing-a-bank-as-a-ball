extends Node2D

func _ready() -> void:

	AudioManger.stop_all()
	AudioManger.play("res://music/the what 2.mp3")
