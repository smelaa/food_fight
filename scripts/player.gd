extends Area2D

@export var speed = 500
@export var bullet_scene: PackedScene
@export var shoot_offset = Vector2(0, -10)

var direction = Vector2.ZERO
var screen_width = 0

func _ready():
	screen_width = get_viewport().get_visible_rect().size.x

# @onready var collision_rect: CollisionShape2D = $PlayerCollisionShape

func _physics_process(delta: float) -> void:
	var input = Input.get_axis("player_left", "player_right")
	
	
	if input > 0:
		direction = Vector2.RIGHT
	elif input < 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
		
	var new_position_x = position.x + speed * delta * direction.x
	if new_position_x<0:
		new_position_x=0
	elif new_position_x>screen_width:
		new_position_x=screen_width
	position.x = new_position_x

func _unhandled_input(event):
	if event.is_action_pressed("player_shoot"):
		shoot_bullet()

func shoot_bullet():
	var bullet = bullet_scene.instantiate() as Node2D
	bullet.position = position + shoot_offset
	get_parent().add_child(bullet)
