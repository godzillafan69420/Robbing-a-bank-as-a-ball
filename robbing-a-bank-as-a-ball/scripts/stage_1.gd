extends Node2D

func _ready() -> void:
	Global.tries +=1
	Global.STAGE1time = 0
	AudioManger.stop_all()
	AudioManger.play("res://music/the what 2.mp3")

func _process(delta: float) -> void:
	Global.STAGE1time += delta
