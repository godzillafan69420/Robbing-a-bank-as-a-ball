extends RigidBody2D



func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet") :
		queue_free()
		area.queue_free()
	if area.is_in_group("enemy"):
		if area is enemyBullet:
			area.queue_free()
		queue_free()
