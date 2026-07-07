extends Node2D

@onready var player = $player
@onready var timer = $Timer

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/mainmenu.tscn")


func _on_area_2d_body_entered(body):
	if body.is_in_group("Players"):
		body.frozen = true
	timer.start(1)
	$"EdimarRamide-death2-340040".play()

func _on_timer_timeout():
	get_tree().reload_current_scene()
