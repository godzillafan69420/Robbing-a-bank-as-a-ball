extends Area2D

var damage = 50
const BLASTFORCE = 3000
@export var explosion: AudioStream

func _ready() -> void:
	AudioManager.play_oneshot(explosion)
	$AnimatedSprite2D.play()
func _on_timer_timeout() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.HP -= 1





func _on_blast_force_detection_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		await get_tree().create_timer(0.1).timeout
		body.velocity = (body.position- position).normalized() * BLASTFORCE
