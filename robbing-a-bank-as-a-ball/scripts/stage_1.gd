extends Node2D

@onready var pauseUI: CanvasLayer = $pause
@export var loadingAnimation: Control

func _ready() -> void:
	loadingAnimation.get_node("player").play("fadeIn")
	get_tree().paused = true
	Global.stageNum =1
	Global.tries +=1
	Global.STAGE1time = 0
	pauseUI.visible = false
	await get_tree().create_timer(0.7).timeout
	get_tree().paused = false
	AudioManager.play("stage1")

func _process(delta: float) -> void:
	Global.STAGE1time += delta
	if Input.is_action_just_pressed("pauses"):
		if get_tree().paused == false:
			pauseUI.visible = true
			get_tree().paused = true
		
	
