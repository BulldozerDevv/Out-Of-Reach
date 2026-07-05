extends StaticBody2D

@export var new_position: Vector2 = Vector2 (0,0)

func _on_area_2d_body_entered(body):
	if body.name == 'player':
		$Timer.start(0.00001)

func _on_timer_timeout():
	self.position = new_position
