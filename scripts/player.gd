extends "res://scripts/character.gd"

@export var shoot_interval = 0.2 
var shoot_timer := 0.0

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
	
	shoot_timer -= delta

	if Input.is_action_pressed("player_shoot") and shoot_timer <= 0:
		shoot_bullet()
		shoot_timer = shoot_interval

#func _unhandled_input(event):
	#if event.is_action_pressed("player_shoot"):
		#shoot_bullet()
