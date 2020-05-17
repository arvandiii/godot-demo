extends Node2D


var letter = ""

func init(letter):
	self.letter = letter

func _ready():
	$Sprite.texture = load("res://ButtonLocked.png") if letter == "" else load("res://Button.png")
	$Letter.text = letter
