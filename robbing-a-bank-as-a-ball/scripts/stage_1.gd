extends Node2D

@onready var pauseUI: CanvasLayer = $pause
@export var loadingAnimation: Control
var ranMusic: int

func _ready() -> void:
	ranMusic = randi() % 2
	loadingAnimation.get_node("player").play("fadeIn")
	get_tree().paused = true
	Global.stageNum =1
	Global.tries +=1
	Global.STAGE1time = 0
	pauseUI.visible = false
	await get_tree().create_timer(0.7).timeout
	get_tree().paused = false
	if Global.badapple:
		AudioManager.play("secret")
	elif ranMusic == 0:
		AudioManager.play("stage1")
	elif ranMusic == 1:
		AudioManager.play("stage1Old")
		

func _process(delta: float) -> void:
	Global.STAGE1time += delta
	if Input.is_action_just_pressed("pauses"):
		if get_tree().paused == false:
			pauseUI.visible = true
			get_tree().paused = true
		
	
