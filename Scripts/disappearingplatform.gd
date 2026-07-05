extends StaticBody2D

func _on_area_2d_body_entered(body):
	if body.name == 'player':
		$Timer.start(0.00001)

func _on_timer_timeout():
	self.position = Vector2(400,366)
