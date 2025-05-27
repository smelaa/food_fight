extends Control

var screens = []
var current_index = 0

func _ready():
	screens = [
		$ScreenContainer/TostMenu,
		$ScreenContainer/PizzaMenu,
		$ScreenContainer/PizzaSliceMenu,
		$ScreenContainer/ChocoMenu,
		$ScreenContainer/CookieMenu,
		$ScreenContainer/SpaghettiMenu,
	]
	
	for i in range(screens.size()):
		screens[i].visible = (i == current_index)
	
	$PreviousButton.disabled = true
	$PreviousButton.pressed.connect(_on_PreviousButton_pressed)
	$NextButton.pressed.connect(_on_NextButton_pressed)
	$BackToMenuButton.pressed.connect(_on_BackToMenuButton_pressed)

func _show_screen(index):
	for i in range(screens.size()):
		screens[i].visible = (i == index)

func _on_PreviousButton_pressed():
	$NextButton.disabled = false
	current_index = (current_index - 1) % screens.size()
	if current_index == 0:
		$PreviousButton.disabled = true
	_show_screen(current_index)

func _on_NextButton_pressed():
	$PreviousButton.disabled = false
	current_index = (current_index + 1) % screens.size()
	if current_index == screens.size()-1:
		$NextButton.disabled = true
	_show_screen(current_index)

func _on_BackToMenuButton_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")  
