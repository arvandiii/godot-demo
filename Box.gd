extends Node2D

var Game = ""
var letter = ""
var previous_mouse_position = Vector2()
var is_dragging = false
var is_draggable = false

func _ready():
	z_index = 0
	set_letter(letter)

func set_draggable(is_draggable):
	self.is_draggable = is_draggable

func set_letter(new_letter):
	letter = new_letter
	$Sprite.texture = load("res://ButtonLocked.png") if letter == "" else load("res://Button.png")
	$Letter.text = letter
	
func set_game(game):
	self.Game = game
	
func get_letter():
	return letter

func _on_Box_input_event(viewport, event, shape_idx):
	if not is_draggable:
		return

	if event.is_action_pressed("ui_touch"):
		print(event)
		get_tree().set_input_as_handled()
		previous_mouse_position = event.position
		is_dragging = true
		z_index = 1

func _input(event):
	if not is_draggable or not is_dragging:
		return
	
	if event.is_action_released("ui_touch"):
		previous_mouse_position = Vector2()
		is_dragging = false
		z_index = 0
		Game.request_move(event.position, self)
	
	
	if is_dragging and event is InputEventMouseMotion:
		position += event.position - previous_mouse_position
		previous_mouse_position = event.position
