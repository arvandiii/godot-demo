extends Area2D

var letter = ""

var previous_mouse_position = Vector2()
var is_dragging = false

func init(letter):
	self.letter = letter

onready var Box = preload("res://Box.tscn")

func _ready():
	var box = Box.instance()
	box.init(letter)
	add_child(box)
	

func _on_Draggable_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("ui_touch"):
		print(event)
		get_tree().set_input_as_handled()
		previous_mouse_position = event.position
		is_dragging = true


func _input(event):
	if not is_dragging:
		return
	
	if event.is_action_released("ui_touch"):
		previous_mouse_position = Vector2()
		is_dragging = false
	
	
	if is_dragging and event is InputEventMouseMotion:
		position += event.position - previous_mouse_position
		previous_mouse_position = event.position
