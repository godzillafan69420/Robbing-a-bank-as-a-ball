extends Node2D

@export var thickOfIt: AudioStream
@export var dying: AudioStream
@export var rolled: AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$settings/vol.value = -4
	$Rick.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_turn_off_music_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)


func _on_vol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")

func rickRolled():
	$settings/useless.button_pressed = false
	$settings/useless2.button_pressed = false
	$settings/useless3.button_pressed = false
	$settings/tuffMode.button_pressed = false
	rolled.play("rolled")


func _on_useless_4_toggled(toggled_on: bool) -> void:
	Global.badapple = toggled_on


func _on_thick_ofit_button_down() -> void:
	AudioManager.play_oneshot(thickOfIt)


func _on_dies_ofdeath_button_down() -> void:
	AudioManager.play_oneshot(dying)


func _on_useless_button_down() -> void:
	rickRolled()


func _on_useless_2_button_down() -> void:
	rickRolled()

func _on_useless_3_button_down() -> void:
	rickRolled()


func _on_tuff_mode_button_down() -> void:
	rickRolled()
