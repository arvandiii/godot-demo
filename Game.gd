extends Node2D


var isPlayerTurn = true
onready var Board = $Board
onready var Deck = $Deck

func _ready():
	pass

func request_move(pos, box):
	Board.remove_box(box)
	if Board.is_valid_global_pos(pos):
		Board.set_box_at_global_pos(box, pos)
	else:
		Deck.revert_box(box)
		
		
func submit():
#	Board.check_new_word()
#	Board.update()
#	Deck.remove_from_deck()
	Deck.process_deck()

	
