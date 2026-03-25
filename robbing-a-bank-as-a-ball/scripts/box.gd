extends RigidBody2D

const boxExplosion = preload("res://scenes/box_explosion.tscn")
var isBreaking: bool = false


func _on_area_2d_area_entered(area: Area2D) -> void:
	
	if area.is_in_group("bullet") and !isBreaking:
		isBreaking = true
		var boom = boxExplosion.instantiate()
		boom.position = position
		get_parent().add_child(boom)
		queue_free()
		if area is  ExplosionHitbox or  area is slam:
			return
			
			
		area.queue_free()
	if area.is_in_group("enemy"):
		var boom = boxExplosion.instantiate()
		boom.position = position
		get_parent().add_child(boom)
		if area is enemyBullet:
			area.queue_free()
		queue_free()
