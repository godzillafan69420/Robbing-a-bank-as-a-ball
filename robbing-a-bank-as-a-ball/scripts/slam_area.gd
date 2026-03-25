extends Area2D

class_name slam

var damage: int = 10


func _on_timer_timeout() -> void:
	queue_free()
