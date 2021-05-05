extends Spatial
class_name Fixed_Map

var location_type
var cells = []
var celDat = [] # [ x, y, terrain ]
var subcells = []
var tiles = []
var location_name = ""
var biome
var neighbors = []
var worldRef
var sublocations = []
export var size = 0
var fullsize = 0

var gen = false #toggle for if stored


func GenarateMap(dat, worl, bio): # [ num, size, biome ]
	worldRef = worl
	biome = bio
	var center = size + 1
	var tick = 0
	var z = (size * fullsize) + center - 1
	for c in cells:
		
		if tick == z:
			celDat.append(["Urban"])
		else:
			celDat.append(["Plains"])
		
		print("Genarating Cell:" + str(tick + 1))
		c.GenarateCell(celDat[tick],self)
		tick +=1
		pass
	pass


func _ready():
	fullsize = (size * 2) + 1
	var s
	for k in self.get_children():
		k._ready()
		cells.append(k)
		pass
		
		
		pass
	
	pass # Replace with function body.


