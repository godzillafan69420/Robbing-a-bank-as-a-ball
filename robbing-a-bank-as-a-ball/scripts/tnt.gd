extends RigidBody2D

const Explosion = preload("res://scenes/explosion.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("bullet"):

		var newExplosion =  Explosion.instantiate()
		newExplosion.position = position
		get_parent().add_child(newExplosion)
		queue_free()
