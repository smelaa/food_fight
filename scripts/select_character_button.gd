extends Button

@export var character: PackedScene

func _ready():
	enable_not_selected()

func _pressed():
	GameState.selected_character = character
	disabled = true

func enable_not_selected():
	disabled = false
	if GameState.selected_character == character:
		disabled = true
