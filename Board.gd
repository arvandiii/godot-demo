extends TileMap

# TODO: change box name to input box or another proper name
onready var Game = get_parent()

var tile_size = get_cell_size()
var half_tile_size = get_cell_size() / 2

var grid_size = Vector2(5, 5)
var grid = []

onready var Box = preload("res://Box.tscn")

func _ready():
	init_board()

func init_board():
	for x in range(grid_size.x):
		grid.append([])
		for y in range(grid_size.y):
			var empty_box = Box.instance()
			empty_box.set_game(Game)
			var pos = Vector2(x, y)
			empty_box.position = map_to_world(pos) + half_tile_size
			grid[x].append(empty_box)
			add_child(empty_box)


func is_valid_global_pos(global_pos):
	var pos = world_to_map(global_pos)
	if Rect2(Vector2(0, 0), grid_size).has_point(pos):
		var box = grid[pos.x][pos.y]
		if box.get_letter() == "":
			return true
	return false

func set_box_at_global_pos(box, global_pos):
	print(global_pos, world_to_map(global_pos))
	var pos = world_to_map(global_pos)
	box.get_parent().remove_child(box)
	box.position = map_to_world(pos) + half_tile_size
	print(box.position)
	add_child(box)
