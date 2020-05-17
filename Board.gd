extends TileMap

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
			var empty_box = create_box("")
			var pos = Vector2(x, y)
			empty_box.position = map_to_world(pos) + half_tile_size
			grid[x].append(empty_box)
			add_child(empty_box)
	
func create_box(letter):
	var box = Box.instance() 
	box.init(letter)
	return box
