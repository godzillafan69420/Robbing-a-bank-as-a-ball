extends Node2D

func _ready() -> void:
	Global.tries +=1
	Global.STAGE1time = 0

	AudioManager.play("stage1")

func _process(delta: float) -> void:
	Global.STAGE1time += delta
