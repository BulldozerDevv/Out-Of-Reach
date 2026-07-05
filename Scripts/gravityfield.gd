extends Area2D

@onready var collision_shape_2d = $CollisionShape2D

func _draw():
	draw_rect(collision_shape_2d.shape.get_rect(), collision_shape_2d.debug_color)

func _on_body_entered(body):
	if body.is_in_group("Players"):
		body.reverse_gravity(true)

func _on_body_exited(body):
	if body.is_in_group("Players"):
		body.reverse_gravity(false)
