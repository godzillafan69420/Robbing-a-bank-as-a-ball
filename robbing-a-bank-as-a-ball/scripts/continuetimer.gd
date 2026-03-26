extends Node2D

@onready var pauseUI: CanvasLayer = $pause
@export var StageNum: int = 0

func _ready() -> void:
	pauseUI.visible = false

func _process(delta: float) -> void:

	Global.STAGE1time += delta
	if Input.is_action_just_pressed("pauses"):
		if get_tree().paused == false:
			pauseUI.visible = true
			get_tree().paused = true
