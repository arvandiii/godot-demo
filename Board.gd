extends GridContainer

export var rows = 10

func _ready():
	for i in columns:
		for j in rows:
			var cell = preload("res://Cell.tscn").instance()
			add_child(cell)
		
