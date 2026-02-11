extends Area2D

const bulletSpeed = 700

func _process(delta: float) -> void:
	position += transform.x *bulletSpeed * delta
	

func _on_timer_timeout() -> void:
	queue_free()
