extends VBoxContainer

func _ready():
	$NewGameButton.pressed.connect(_on_NewGameButton_pressed)

func _on_NewGameButton_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")  
