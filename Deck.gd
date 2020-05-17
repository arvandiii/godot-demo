extends GridContainer

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

var MAX_DECK_SIZE = 7

func _ready():
	columns = MAX_DECK_SIZE
	while get_child_count() < MAX_DECK_SIZE:
		addRandomCell()

func addRandomCell():
	var cell = preload("res://Cell.tscn").instance()
	remained_letters.shuffle()
	cell.letter = remained_letters[0]
	remained_letters.remove(0)
	self.add_child(cell)
