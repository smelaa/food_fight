extends CanvasLayer

func _load_game() -> void:
	print("button pressed")
	get_tree().change_scene_to_file("res://scenes/main.tscn")
