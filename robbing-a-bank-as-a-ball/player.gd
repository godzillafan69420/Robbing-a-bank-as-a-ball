extends CharacterBody2D



const SPEED = 300.0
const JUMP_VELOCITY = -400.0
enum States {ragdoll, walking, dead, idle}
var Currentstate = States.idle
var mouseposition: Vector2
var mouseDirection: Vector2
var canJump: bool = true
func _process(delta: float) -> void:
	mouseposition = get_global_mouse_position()
	mouseDirection = mouseposition - position
	
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction == 1:
		$direction.scale = Vector2(1,1)
	elif direction == -1:
		$direction.scale = Vector2(-1,1)
	if direction:
		Currentstate = States.walking
	else:
		Currentstate = States.idle
	if Currentstate == States.walking:
		velocity.x = direction * SPEED
		$direction/AnimatedSprite2D.stop()
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and canJump:
		velocity = mouseDirection.normalized() * 500 * -1
		canJump = false
	elif Currentstate != States.walking and is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED)
		$direction/AnimatedSprite2D.play("idle")
	
		
	move_and_slide()


func _on_shoot_timer_timeout() -> void:
	canJump = true
