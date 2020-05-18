extends Node2D

# TODO: change box to class and inherit from it

var letter = ""

func init(letter):
	self.letter = letter

func _ready():
	set_letter(letter)

func set_letter(new_letter):
	letter = new_letter
	$Sprite.texture = load("res://ButtonLocked.png") if letter == "" else load("res://Button.png")
	$Letter.text = letter
