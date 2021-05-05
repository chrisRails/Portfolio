extends Node
class_name DS_Cell

var tiles = []
var x = 0
var y = 0
var terrain

func _init(ter, co, ms):
	terrain = ter
	x = co[0]
	y = co[1]
	if ter.name == "Border":
		tiles = terrain.Get_Pattern(x, y, ms)
	elif ter.name == "Blank":
		pass
	else:
		tiles = terrain.Get_Pattern(x, y)
	
	pass
		







func _ready():
	pass # Replace with function body.



