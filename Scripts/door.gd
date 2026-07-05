extends Area2D

var payerhaskey = false
var playerbody

func  _input(event):
	if event.is_action_pressed("right") && playerhaskey:
		get_tree().change_scene_to_file("res://Scenes/mainmenu.tscn")
	elif event.is_action_pressed("left") && playerhaskey:
		get_tree().change_scene_to_file("res://Scenes/mainmenu.tscn")

func _on_body_entered(body):
	if body.name == 'player':
		var playerbody = body 
		if body.haskey:
			playerhaskey = true
			$AnimatedSprite2D.play("Open")
			body.haskey = false
		else:
			pass


func _on_body_exited(body):
	pass
