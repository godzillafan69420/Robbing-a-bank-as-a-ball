extends Area2D

const bulletSpeed = 300

func _process(delta: float) -> void:
	position += transform.x *bulletSpeed * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		queue_free()
	


func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ground"):
		queue_free()
