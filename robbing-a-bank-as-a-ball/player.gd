extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
enum States {ragdoll, walking, dead, idle}
var Currentstate = States.idle
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		Currentstate = States.walking
	else:
		Currentstate = States.idle
	if Currentstate == States.walking:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.stop()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$AnimatedSprite2D.play("idle")
	move_and_slide()
