extends Control

func _ready():
	$BackToMenuButton.pressed.connect(_on_BackToMenuButton_pressed)
	
func _on_BackToMenuButton_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")  
