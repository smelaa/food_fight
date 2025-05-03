extends Area2D

@export var speed = 500
@export_range(1, 100, 1) var bullet_freq = 3
@export var bullet_scene: PackedScene
@export var shoot_offset = Vector2(0, 10)

var direction = Vector2.LEFT
var screen_width = 0
var timeout = 0

func _ready():
	screen_width = get_viewport().get_visible_rect().size.x

# @onready var collision_rect: CollisionShape2D = $PlayerCollisionShape

func _physics_process(delta: float) -> void:
	var new_position_x = position.x + speed * delta * direction.x
	if new_position_x<0:
		direction = Vector2.RIGHT
		new_position_x=0
	elif new_position_x>screen_width:
		direction = Vector2.LEFT
		new_position_x=screen_width
	position.x = new_position_x


func _on_shoot_timer_timeout() -> void:
	timeout+=1
	if timeout == bullet_freq:
		shoot_bullet()
		timeout=0

func shoot_bullet():
	var bullet = bullet_scene.instantiate() as Node2D
	bullet.position = position + shoot_offset
	get_parent().add_child(bullet)
