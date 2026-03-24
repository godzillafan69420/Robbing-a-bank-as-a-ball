extends CanvasLayer
const tutorial = preload("res://scenes/tutorial.tscn")
var patchNotes: bool = false

var numberAchivement: int = 0
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	if Global.nevershow:
		$Panel.visible = false
	else:
		$Panel.visible = true
		
	
	
	if Global.beatbarry:
		numberAchivement +=1
		$achieveMents/me.visible = true
	if Global.beattutorial:
		numberAchivement +=1
		$achieveMents/tutorial.visible = true
	if Global.beatlevel:
		numberAchivement +=1
		$achieveMents/main.visible = true
	if Global.oldMode:
		numberAchivement +=1
		$"achieveMents/sweat".visible = true
	if Global.beatPersonal:
		
		numberAchivement +=1
		$achieveMents/old.visible = true
	if Global.openLogs:
		numberAchivement +=1
		$achieveMents/son.visible = true
	if Global.PlayThickOfIt:
		numberAchivement +=1
		$achieveMents/tuff.visible = true
	if Global.pacifist:
		numberAchivement +=1
		$achieveMents/passive.visible = true
	if Global.fraudDetector:
		numberAchivement +=1
		$achieveMents/marisa.visible = true
	if Global.death:
		numberAchivement +=1
		$achieveMents/genocide.visible = true
	$"patch notes".visible = false
	if Global.badapple == true:
		
		$Masterart.animation = "fumo"
		AudioManager.play("stage1Old")
	else:
		$Masterart.animation = "default"
		AudioManager.play("stage1")
	
	$timeStage1.text = "Best Time: " + str(roundf(Global.topTime))

func _process(delta: float) -> void:
	$Label2.text = "Achievements " + str(numberAchivement) + "/10"


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
			
			$achieveMents/son.visible = true
	else:
		$"patch notes".visible = false


func _on_never_show_up_button_down() -> void:
	Global.nevershow = true
	$Panel.visible = false
