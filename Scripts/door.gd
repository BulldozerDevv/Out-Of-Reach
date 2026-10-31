extends Area2D

var player_has_key = false
var player_inside = false

func _input(event):
	if player_has_key and player_inside:
		if event.is_action_pressed("right") or event.is_action_pressed("left"):
			get_tree().change_scene_to_file("res://Scenes/mainmenu.tscn")

func _on_body_entered(body):
	if body.name == "player":
		player_inside = true
		if body.haskey:
			player_has_key = true
			$AnimatedSprite2D.play("Open")
			body.haskey = false

func _on_body_exited(body):
	if body.name == "player":
		player_inside = false
