extends Area2D
signal hit

func _on_body_entered(body):
	hide()
	hit.emit() 
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
