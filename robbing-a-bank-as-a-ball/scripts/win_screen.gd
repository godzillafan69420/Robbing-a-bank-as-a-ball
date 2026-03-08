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
	elif Global.STAGE1time < 40:
		$message.text = "he might be the goat"
	elif Global.STAGE1time < 50:
		$message.text = "you tried your best.
		You're trash!!!"
	elif Global.STAGE1time < 60:
		$message.text = "almost hit a minute. almost"
	
	elif Global.STAGE1time < 70:
		$message.text = "have a participation reward"
	elif Global.STAGE1time == 67:
		$message.text = "mango, mustard, burger 67 "
	elif Global.STAGE1time >= 70:
		$message.text = "in the end the bank is still
		dumb enough to not move the money"


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


func _on_button_2_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")
