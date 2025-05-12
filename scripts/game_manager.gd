extends Node2D

var villain_types: Array[PackedScene] = [
	preload("res://scenes/vilians/tost.tscn"),
	preload("res://scenes/vilians/pizza_big.tscn"),
	preload("res://scenes/vilians/pizza_small.tscn"),
	preload("res://scenes/vilians/cookie.tscn"),
	preload("res://scenes/vilians/choco.tscn"),
] # Assign your villain scenes in Inspector
var current_villain: Node = null
var current_index := 0

func _ready():
	spawn_next_villain()

func spawn_next_villain():
	if current_index >= villain_types.size():
		print("All villains defeated!")
		return

	var villain_scene = villain_types[current_index]
	current_villain = villain_scene.instantiate()
	add_child(current_villain)

	# Watch for its death
	current_villain.connect("defeated", _on_villain_defeated)

func _on_villain_defeated():
	await get_tree().create_timer(2.0).timeout
	current_index += 1
	spawn_next_villain()
