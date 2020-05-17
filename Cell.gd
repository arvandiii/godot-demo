extends TextureRect

export var letter = ""

func _ready():
	print("inja", letter)
	texture = load("res://ButtonLocked.png") if letter == "" else load("res://Button.png")
	$Label.text = letter
		
	
	
