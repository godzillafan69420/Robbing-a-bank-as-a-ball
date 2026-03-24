extends CanvasLayer

@export var stageNumber = 0



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	$kills.text = "kills: " + str(Global.kills)
	if stageNumber == 1:
		$Label.text = str(round(Global.STAGE1time ))
	if stageNumber == -1:
		$Label.text = str(round(Global.surviveTime ))
