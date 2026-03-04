extends CanvasLayer
const tutorial = preload("res://scenes/tutorial.tscn")

# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if Global.badapple == true:
		$Masterart.animation = "fumo"
	else:
		$Masterart.animation = "default"
	
	AudioManger.stop_all()
	AudioManger.play("res://music/WHAT.mp3")
	
	$timeStage1.text = "Time: " + str(roundf(Global.topTime))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")


func _on_button_2_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/stage_1.tscn")


func _on_button_3_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")
