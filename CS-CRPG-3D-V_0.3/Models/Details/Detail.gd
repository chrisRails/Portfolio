extends Spatial
class_name Detail


var pos
var selfX = 0
var selfY = 0
var tileref
var detail_type = "" # [ solid, door, path, detail ]
export var detail_name = ""
export var anim = false
export var sound = ""


func interact():
	pass


func animation():
	pass


func _ready():
	pass # Replace with function body.

func set_trans(x,y):
	pos = Vector3(x,0,y)
	translate(pos)
