extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")

	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = direction > 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# الأنيميشن
	if not is_on_floor():
		if velocity.y < 0:
			animated_sprite_2d.play("Jump")
		else:
			animated_sprite_2d.play("Fall")
	elif direction:
		animated_sprite_2d.play("Run")
	else:
		animated_sprite_2d.play("Idle")

	move_and_slide()

func _ready():
	animated_sprite_2d.play("Idle")


func _on_area_2d_body_entered(body):
	if body.is_in_group("Boxes"):
		body.collision_layer = 1
		body.collision_mask = 1


func _on_area_2d_body_exited(body):
	if body.is_in_group("Boxes"):
		body.collision_layer = 2
		body.collision_mask = 2
