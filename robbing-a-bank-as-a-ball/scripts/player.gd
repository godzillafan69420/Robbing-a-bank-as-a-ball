extends CharacterBody2D

const HPLook1 = preload("res://art/UI/UI1.png")
const HPLook2 = preload("res://art/UI/UI2.png")
const HPLook3 = preload("res://art/UI/UI3.png")
const HPLook4 = preload("res://art/UI/UI4.png")




const MAXSPEED = 100
const SPEED = 25.0
const shotgunStrength = 670
enum States {ragdoll, walking, dead, idle}
var Currentstate = States.idle
var mouseposition: Vector2
var mouseDirection: Vector2
var canJump: bool = true
var burstCount: int = 2
var momentum: float
var HP: float = 6
var invincibility: bool = false
var UIHP: Sprite2D
func _ready() -> void:
	UIHP = get_node("UI/HP")
func _process(delta: float) -> void:
	mouseposition = get_global_mouse_position()
	mouseDirection = mouseposition - position
	
	
		
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta


	var direction := Input.get_axis("left", "right")
	momentum = SPEED * 0.75 * direction
	if momentum > MAXSPEED:
		momentum = MAXSPEED
	if momentum < -MAXSPEED:
		momentum = -MAXSPEED
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction == 1:
		$direction.scale = Vector2(1,1)
	elif direction == -1:
		$direction.scale = Vector2(-1,1)
	if direction:
		Currentstate = States.walking
	else:
		Currentstate = States.idle
	if Currentstate == States.walking:
		
		$direction/AnimatedSprite2D.stop()
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and canJump and burstCount > 0:
			velocity = mouseDirection.normalized() * shotgunStrength * -1
			
			canJump = false
			burstCount -= 1
		
		velocity.x += momentum
		if velocity.x > 400:
			velocity.x = 400
		if velocity.x < -400:
			velocity.x = -400
	else:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and canJump and burstCount > 0:
			velocity = mouseDirection.normalized() * shotgunStrength * -1
			canJump = false
			burstCount -= 1
		elif Currentstate != States.walking and is_on_floor():
			velocity.x = move_toward(velocity.x, 0, SPEED)
			$direction/AnimatedSprite2D.play("idle")
	
	if HP <= 0:
		print("you die")
	
	if HP >= 5:
		UIHP.texture = HPLook1
	elif HP >= 3:
		UIHP.texture = HPLook2
	elif  HP  >1:
		UIHP.texture = HPLook3
	elif HP == 1:
		UIHP.texture = HPLook4
	move_and_slide()


func _on_shoot_timer_timeout() -> void:
	canJump = true



func _on_reload_time_timeout() -> void:
	burstCount = 2
	canJump = true


func _on_hurt_box_area_entered(area: Area2D) -> void:
	if area.is_in_group("enemy") and !invincibility:
		HP -= 1
		invincibility = true
		$invincibility.start()
		$direction/AnimatedSprite2D.set_modulate(Color8(255,255,255,120))



func _on_invincibility_timeout() -> void:
	invincibility = false
	$direction/AnimatedSprite2D.set_modulate(Color8(255,255,255,255))
