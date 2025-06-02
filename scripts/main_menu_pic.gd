extends TextureRect

func _ready():
	texture = GameState.selected_character.instantiate().get_node('player').get_node('Sprite2D').texture
