extends RigidBody2D

const Explosion = preload("res://scenes/explosion.tscn")
var isBlasting = false
# Called when the node enters the scene tree for the first time.


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):
		if isBlasting:
			return
		var newExplosion =  Explosion.instantiate()
		newExplosion.position = position
		get_parent().add_child(newExplosion)
		isBlasting = true
		queue_free()
		
