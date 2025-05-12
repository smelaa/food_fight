extends Area2D

signal defeated

@export var speed = 0
@export var bullet_scene: PackedScene
@export var shoot_offset = Vector2(0, 0)
@export var max_health = 0
@export var direction = Vector2.ZERO
@export var bullet_speed = 500
@export var bullet_power = 20

var current_health: int
var screen_width = 0

@onready var life_bar: ColorRect = $LifeBar

func _ready():
	current_health = max_health
	screen_width = get_viewport().get_visible_rect().size.x
	update_life_bar()

func move(delta: float):
	var new_position_x = position.x + speed * delta * direction.x
	if new_position_x < 0:
		new_position_x = 0
	elif new_position_x > screen_width:
		new_position_x = screen_width
	position.x = new_position_x

func shoot_bullet():
	var bullet = bullet_scene.instantiate() as Node2D
	bullet.position = position + shoot_offset
	bullet.speed = bullet_speed
	bullet.power = bullet_power
	get_parent().add_child(bullet)

func take_damage(amount: int):
	current_health = max(0, current_health - amount)
	update_life_bar()
	if current_health == 0:
		emit_signal("defeated")
		queue_free()

func update_life_bar():
	var percent = float(current_health) / max_health
	life_bar.scale.x = percent
