extends CanvasLayer

@export var stageNumber = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stageNumber == 1:
		$Label.text = str(round(Global.STAGE1time ))
