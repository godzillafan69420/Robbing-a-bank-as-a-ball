extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$settings/vol.value = -4


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_turn_off_music_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(0, toggled_on)


func _on_vol_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(0,value)


func _on_button_button_down() -> void:
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


	


func _on_useless_4_toggled(toggled_on: bool) -> void:
	Global.badapple = toggled_on


func _on_thick_ofit_button_down() -> void:
	AudioManger.play("res://sfx/play on the lowest volume.wav")


func _on_dies_ofdeath_button_down() -> void:
	AudioManger.play("res://sfx/dyingagain.mp3")
