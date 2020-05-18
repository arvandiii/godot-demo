extends TileMap

var deck_size = 7
var half_tile_size = get_cell_size() / 2

onready var Draggable = preload("res://DraggableBox.tscn")

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
		var draggable = Draggable.instance()
		remained_letters.shuffle()
		draggable.init(remained_letters[0])
		remained_letters.remove(0)
		var pos = Vector2(x, 0)
		draggable.position = map_to_world(pos) + half_tile_size
		self.add_child(draggable)
