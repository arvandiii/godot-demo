extends Area2D

var letter = ""
var box = null

var previous_mouse_position = Vector2()

func init(letter):
	self.letter = letter

onready var Box = preload("res://Box.tscn")


func _ready():
	box = Box.instance()
	box.init(letter)
	add_child(box)


#func _input(event):
#	if event.is_action_released("ui_touch"):
#		print("injaaa", get_overlapping_areas())
#		var overlapping_areas = get_overlapping_areas()
#		if overlapping_areas.size() > 0:
#			var dragged_box = overlapping_areas[0]
#			box.set_letter(dragged_box.get_letter())
			

func get_letter():
	return letter
