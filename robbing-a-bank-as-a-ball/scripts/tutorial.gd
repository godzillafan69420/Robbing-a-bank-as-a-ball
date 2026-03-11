extends Node2D

@onready var pauseUI: CanvasLayer = $pause
@export var loadingAnimation: Control

func _ready() -> void:
	loadingAnimation.get_node("player").play("fadeIn")
	pauseUI.visible = false
	get_tree().paused = true
	await get_tree().create_timer(0.7).timeout
	get_tree().paused = false
	AudioManager.play("tutorial")
	loadingAnimation.visible = false

	
	

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pauses"):
		if get_tree().paused == false:
			pauseUI.visible = true
			get_tree().paused = true
