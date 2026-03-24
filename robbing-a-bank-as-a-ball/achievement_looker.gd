extends Area2D

@export_multiline() var discripttion: String
@export var title: String

var discription_text:Label
var title_name:Label
var panel: Panel

var MouseIsInArea = false



func _ready() -> void:
	
	panel= get_parent().get_parent().find_child("achivementDiscription")
	discription_text = panel.find_child("discription")
	title_name = panel.find_child("title")

func _process(_delta: float) -> void:
	if MouseIsInArea:
		panel.visible = true
		discription_text.text = discripttion
		title_name.text = title
		
	
func _on_mouse_entered() -> void:
	MouseIsInArea = true
	print(MouseIsInArea)


func _on_mouse_exited() -> void:
	MouseIsInArea = false
	panel.visible = false
	discription_text.text = ""
	title_name.text = ""
