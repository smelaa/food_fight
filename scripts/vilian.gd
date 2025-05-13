extends "res://scripts/character.gd"

@export_range(1, 100, 1) var bullet_freq = 10

var timeout = 0
var spawned = false

func _physics_process(delta: float) -> void:
	
	if not spawned:
		position.y += speed/4 * delta
		if position.y > 	10:
			spawned = true
		return

		
	if randi() % 100 > 95:
		if randi() % 2 == 0:
			direction = Vector2.LEFT
		else:
			direction = Vector2.RIGHT

	var new_position_x = position.x + speed * delta * direction.x
	if new_position_x<0:
		direction = Vector2.RIGHT
		new_position_x=0
	elif new_position_x>screen_width:
		direction = Vector2.LEFT
		new_position_x=screen_width
	position.x = new_position_x


func _on_shoot_timer_timeout() -> void:
	if not spawned:
		return
	timeout+=1
	if timeout == bullet_freq:
		shoot_bullet()
		timeout=0
