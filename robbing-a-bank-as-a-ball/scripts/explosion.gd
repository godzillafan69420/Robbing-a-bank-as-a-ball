extends Area2D

var damage = 50
const BLASTFORCE = 1500

func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.HP -= 3





func _on_blast_force_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.velocity = (body.position- position).normalized() * BLASTFORCE
