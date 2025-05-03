extends Area2D

@export var speed = 300

func _process(delta):
	position.y -= speed * delta
	if position.y < 0:
		queue_free()  # Remove bullet when offscreen
