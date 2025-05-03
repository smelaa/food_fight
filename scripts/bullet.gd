extends Area2D

@export var speed = 300
@export var direction = Vector2.UP

func _process(delta):
	position.y += speed * delta * direction.y
	if position.y < 0 or position.y > get_viewport().get_visible_rect().size.y:
		queue_free()  # Remove bullet when offscreen
