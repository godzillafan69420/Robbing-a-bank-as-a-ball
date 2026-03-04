extends Node2D

@export var StageNum: int = 0

func _process(delta: float) -> void:
	if StageNum == 1:
		Global.STAGE1time += delta
