extends VBoxContainer

func _ready():
	$NewGameButton.pressed.connect(_on_NewGameButton_pressed)
	$EnemiesButton.pressed.connect(_on_EnemiesButton_pressed)
	$CreditsButton.pressed.connect(_on_CreditsButton_pressed)
	$FightersButton.pressed.connect(_on_FightersButton_pressed)

func _on_NewGameButton_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")  
	
func _on_EnemiesButton_pressed():
	get_tree().change_scene_to_file("res://scenes/vilian_menu/vilian_menu.tscn")  
	
func _on_CreditsButton_pressed():
	get_tree().change_scene_to_file("res://scenes/credits.tscn") 
	
func _on_FightersButton_pressed():
	get_tree().change_scene_to_file("res://scenes/player_menu/player_menu.tscn")  
