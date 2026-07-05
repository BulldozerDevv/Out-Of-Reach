extends Area2D

func _on_body_entered(body):
	if body.name == 'player':
		body.haskey = true
		queue_free()

func _on_body_exited(body):
	pass # Replace with function body.
