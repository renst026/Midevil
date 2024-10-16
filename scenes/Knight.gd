extends CharacterBody2D
signal hit

const SPEED = 300.0
const JUMP_VELOCITY = -550.0
func _physics_process(delta: float) -> void:
	 #Walking animation 
	if (velocity.x > 1 || velocity.x < -1):
		$Sprite2D.animation = "walking"
	else:
		$Sprite2D.animation = "idle" 
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)

	move_and_slide()
	
	if Input.is_action_just_pressed('left'):
		$Sprite2D.flip_h = true
	if Input.is_action_just_pressed('right'):
		$Sprite2D.flip_h = false

	

func _on_area_2d_area_entered(area: Area2D) -> void:
	hit.emit()
	
