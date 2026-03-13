extends Node2D

@onready var pauseUI: CanvasLayer = $pause
@export var loadingAnimation: Control
func _ready() -> void:
	AudioManager.play("yes")

	get_tree().paused = true
	Global.stageNum = 0
	Global.STAGE1time = 0
	await get_tree().create_timer(0.7).timeout
	get_tree().paused = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pauses"):
		if get_tree().paused == false:
			pauseUI.visible = true
			get_tree().paused = true
