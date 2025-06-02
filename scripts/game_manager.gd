extends Node2D

var villain_types: Array[PackedScene] = [
	preload("res://scenes/vilians/spaghetti.tscn"),
	preload("res://scenes/vilians/pizza_big.tscn"),
	preload("res://scenes/vilians/pizza_small.tscn"),
	preload("res://scenes/vilians/cookie.tscn"),
	preload("res://scenes/vilians/choco.tscn"),
	preload("res://scenes/vilians/tost.tscn"),
]

var current_score := 0
var current_wave_size := 0
var villains_remaining := 0
var player_node
var player_body

@onready var score_label: Label = $ScoreLabel

func _ready():
	player_node = GameState.selected_character.instantiate()
	add_child(player_node)
	player_body = player_node.get_node("player")
	player_body.game_manager = self
	randomize()
	$BackToMenuButton.pressed.connect(_on_BackToMenuButton_pressed)
	start_next_wave()

func start_next_wave():
	current_wave_size = randi_range(3, 7)  # You can adjust the range
	villains_remaining = current_wave_size

	for i in range(current_wave_size):
		spawn_villain()

func spawn_villain():
	var random_index = randi() % villain_types.size()
	var villain_scene = villain_types[random_index]
	var villain = villain_scene.instantiate()
	villain.game_manager = self
	
	var screen_width = 1920
	var margin = 100  # optional padding from edges
	var random_x = randf_range(margin, screen_width - margin)
	
	villain.position.x = random_x
	
	add_child(villain)

	villain.connect("defeated", _on_villain_defeated)

func _on_villain_defeated():
	villains_remaining -= 1
	await get_tree().create_timer(1.0).timeout

	if villains_remaining == 0:
		await get_tree().create_timer(1.0).timeout
		start_next_wave()

func increase_score(amount: int):
	current_score += amount
	print("Score: ", current_score)
	score_label.text = "Score: %d" % current_score

func _on_BackToMenuButton_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
