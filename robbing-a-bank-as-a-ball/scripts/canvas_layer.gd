extends CanvasLayer
const tutorial = preload("res://scenes/tutorial.tscn")
var patchNotes: bool = false

var numberAchivement: int = 0
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if Global.beatbarry:
		numberAchivement +=1
		$achieveMents/Todd.visible = true
	if Global.beattutorial:
		numberAchivement +=1
		$achieveMents/Unnamed.visible = true
	if Global.beatlevel:
		numberAchivement +=1
		$achieveMents/Ui1.visible = true
	if Global.oldMode:
		numberAchivement +=1
		$"achieveMents/NewPiskel(2)".visible = true
	if Global.beatPersonal:
		
		numberAchivement +=1
		$achieveMents/Ui4.visible = true
	if Global.openLogs:
		numberAchivement +=1
		$achieveMents/WhyBother.visible = true
	$"patch notes".visible = false
	if Global.badapple == true:
		
		$Masterart.animation = "fumo"
		AudioManager.play("yes")
	else:
		$Masterart.animation = "default"
		AudioManager.play("MainMenu")
	
	$timeStage1.text = "Best Time: " + str(roundf(Global.topTime))

func _process(delta: float) -> void:
	$Label2.text = "Achievements " + str(numberAchivement) + "/6"


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")


func _on_button_2_button_down() -> void:
	
	get_tree().change_scene_to_file("res://scenes/stage_1.tscn")


func _on_button_3_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_button_4_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/credits.tscn")


func _on_button_5_button_down() -> void:
	
	if $"patch notes".visible == false:
		if !Global.openLogs:
			numberAchivement +=1
			Global.openLogs = true
		$"patch notes".visible = true
		if Global.openLogs:
			
			$achieveMents/WhyBother.visible = true
	else:
		$"patch notes".visible = false
