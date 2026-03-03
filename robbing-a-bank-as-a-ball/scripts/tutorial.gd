extends Node2D

func _ready() -> void:

	AudioManger.stop_all()
	AudioManger.play("res://music/yeahtutorial.mp3")
