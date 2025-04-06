extends Area2D

@export var speed = 500
var direction = Vector2.ZERO

# @onready var collision_rect: CollisionShape2D = $PlayerCollisionShape


func _physics_process(delta: float) -> void:
	var input = Input.get_axis("player_left", "player_right")
	
	
	if input > 0:
		direction = Vector2.RIGHT
	elif input < 0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
		
		
	var delta_movement = speed * delta * direction.x
	
	position.x += delta_movement
