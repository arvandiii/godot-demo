extends TileMap

var deck_size = 7
var half_tile_size = get_cell_size() / 2

onready var Game = get_parent()
onready var Box = preload("res://Box.tscn")
var grid = []

var remained_letters = [
	"A",
	"B",
	"C",
	"D",
	"A",
	"B",
	"C",
	"D",
	"E",
	"F",
	"G",
	"H",
	"I",
	"J",
	"K",
	"L",
	"M",
	"N",
]

func _ready():
	init_deck()

func init_deck():
	for x in range(deck_size):
		var box = Box.instance()
		remained_letters.shuffle()
		box.set_letter(remained_letters[0])
		box.set_draggable(true)
		box.set_game(Game)
		remained_letters.remove(0)
		var pos = Vector2(x, 0)
		box.position = map_to_world(pos) + half_tile_size
		grid.append(box)
		self.add_child(box)

func remove_from_deck(box):
	var i = grid.find(box)
	grid[i] = null
	remove_child(box)
	

func process_deck():
	for x in range(deck_size):
		if not grid[x]:
			var box = Box.instance()
			remained_letters.shuffle()
			box.set_letter(remained_letters[0])
			box.set_draggable(true)
			remained_letters.remove(0)
			var pos = Vector2(x, 0)
			box.position = map_to_world(pos) + half_tile_size
			grid[x] = box
			self.add_child(box)
	
func revert_box(box):
	var x = grid.find(box)
	var pos = Vector2(x, 0)
	box.get_parent().remove_child(box)
	box.position = map_to_world(pos) + half_tile_size
	add_child(box)
