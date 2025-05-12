extends TextureRect

# Speed of scrolling in pixels per second
var scroll_speed = 100

func _process(delta):
	position.y += scroll_speed * delta

	# Optionally reset position to create a looping effect
	var screen_height = get_viewport_rect().size.y
	if position.y > screen_height:
		position.y = -screen_height
