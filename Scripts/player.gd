extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const AIR_DECEL = 300.0  # سرعة التخفيض بالهواء (جربها وغيرها حسب الإحساس اللي تبيه)
var OnPlatVelo = Vector2(0,0)
var air_base_velocity_x = 0.0  # سرعة المنصة وقت آخر لحظة كنت فيها على الأرض
var pushforce = 80.0
@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		velocity.x = OnPlatVelo.x
		air_base_velocity_x = OnPlatVelo.x
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		animated_sprite_2d.flip_h = direction > 0
	else:
		var target_x = 0.0 if is_on_floor() else air_base_velocity_x
		velocity.x = move_toward(velocity.x, target_x, AIR_DECEL if not is_on_floor() else SPEED)
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
	OnPlatVelo = get_platform_velocity()
	
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			c.get_collider().apply_central_impulse(-c.get_normal()*pushforce)

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
