extends VBoxContainer

@onready var score_label = $ScoreLabel

func _ready():
	$HBoxContainer/MenuButton.pressed.connect(on_MenuButtonPressed)
	$HBoxContainer/RestartButton.pressed.connect(on_RestartButtonPressed)
	score_label.text = "Score: %d" % GameState.final_score
	
func on_MenuButtonPressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")  
	
func on_RestartButtonPressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
