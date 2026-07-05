extends Path2D


@export var loop: bool = true
@export var speed: float = 2.0
@export var speedscale: float = 1.0
@onready var path = $PathFollow2D
@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if not loop:
		anim.play("movement")
		anim.speed_scale = speedscale
		set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	path.progress += speed
