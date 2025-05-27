extends "res://scripts/bullet.gd"

@export var exploded_power = 200
@export var explosion_prob = 30
@export var exploded_texture: Texture2D

var crossed_center = false

func _ready():
	randomize()
	connect("area_entered", _on_area_entered)

func _process(delta):
	position.y += speed * delta * direction.y
	if position.y < 0 or position.y > get_viewport().get_visible_rect().size.y:
		queue_free()  # Remove bullet when offscreen
	var rand_num = randi() % 100
	if not crossed_center and position.y > get_viewport().get_visible_rect().size.y/2.6 and rand_num<explosion_prob:
		power = exploded_power
		$Sprite2D.texture = exploded_texture
		crossed_center= true
		print(rand_num)
