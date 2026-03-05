extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.tries == 1:
		Global.topTime = Global.STAGE1time
	if Global.topTime > Global.STAGE1time:
		Global.topTime = Global.STAGE1time
	$time.text = "time: " + str(round(Global.STAGE1time))
	$bestTimre.text = "Best time: " + str(round(Global.topTime))
	if Global.STAGE1time < 30:
		$message.text = "what tech is that"
	elif Global.STAGE1time < 32:
		$message.text = "huh how"
	elif Global.STAGE1time == 32:
		$message.text = "my Score"
	elif Global.STAGE1time < 50:
		$message.text = "ok nice"
	elif Global.STAGE1time < 60:
		$message.text = "took you a minute"
	elif Global.STAGE1time < 70:
		$message.text = "you're buns"
	elif Global.STAGE1time == 67:
		$message.text = "67676767676767676767676767"
	elif Global.STAGE1time >= 70:
		$message.text = "you make caseoh look fast"


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


func _on_button_2_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
