extends CharacterBody2D

@export var speed = 10

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(float):
	get_input()
	move_and_slide()
	
