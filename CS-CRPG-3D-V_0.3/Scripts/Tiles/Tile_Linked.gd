extends Spatial

var pos
var X
var Y


var details = []
var subcellRef
var tile_type = "" # [ empty, path, location, impassable ]


func genarate(sub):
	subcellRef = sub
	print("Tile Placed")

func event():
	pass

func interact():
	pass

func detail():
	var de
	#var dat
	if details == []:
		pass
	else:
		for d in details:
			de = d.instance()
			self.add_child(de)
			pass



func set_trans():
	pos = Vector3(X*5 ,0,Y*5)
	translate(pos)
	
func set_hight(z):
	pos = Vector3(X,z,Y)
	translate(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(_delta):
	pass






