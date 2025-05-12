extends Area2D

@export var speed = 300
@export var direction = Vector2.UP
@export var power = 10

func _ready():
	connect("area_entered", _on_area_entered)

func _process(delta):
	position.y += speed * delta * direction.y
	if position.y < 0 or position.y > get_viewport().get_visible_rect().size.y:
		queue_free()  # Remove bullet when offscreen

func _on_area_entered(area):
	if area.has_method("take_damage"):
		area.take_damage(power)  # Call the method on the object we hit
	queue_free()  # Destroy bullet after hitting
