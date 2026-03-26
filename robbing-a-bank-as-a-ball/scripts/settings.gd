extends Node2D

var input:int
var code: Array = [1,3,2,4]
var correct = 0
var clicks = 0
@export var thickOfIt: AudioStream
@export var dying: AudioStream
@export var rolled: AnimationPlayer
@export var rickRollSfx: AudioStream

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$settings/vol.value = -6.4
	$Rick.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	

	if correct == 4:
		get_tree().change_scene_to_file("res://scenes/rick_roll_horror.tscn")
		

func _on_turn_off_music_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)


func _on_vol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")

func rickRolled():
	AudioManager.play_oneshot(rickRollSfx)
	$settings/useless.button_pressed = false
	$settings/useless2.button_pressed = false
	$settings/useless3.button_pressed = false
	$settings/tuffMode.button_pressed = false
	rolled.play("rolled")


func _on_useless_4_toggled(toggled_on: bool) -> void:
	Global.oldMode = true
	Global.badapple = toggled_on


func _on_thick_ofit_button_down() -> void:
	Global.PlayThickOfIt = true
	AudioManager.play_oneshot(thickOfIt)


func _on_dies_ofdeath_button_down() -> void:
	Global.PlayThickOfIt = true
	AudioManager.play_oneshot(dying)


func _on_useless_button_down() -> void:
	clicks += 1
	input = 1
	if clicks == 1:
		if input == code[0]:
			correct +=1
	rickRolled()


func _on_useless_2_button_down() -> void:
	clicks += 1
	input = 2
	if clicks == 3:
		if input == code[2]:
			correct +=1
	rickRolled()

func _on_useless_3_button_down() -> void:
	clicks += 1
	input = 3
	if clicks == 2:
		if input == code[1]:
			correct +=1
	rickRolled()


func _on_tuff_mode_button_down() -> void:
	clicks += 1
	input = 4
	if clicks == 4:
		if input == code[3]:
			correct +=1
	rickRolled()


func _on_music_value_changed(value: float) -> void:
	Global.MusicVolume = value
	AudioManager.changeVolume()
