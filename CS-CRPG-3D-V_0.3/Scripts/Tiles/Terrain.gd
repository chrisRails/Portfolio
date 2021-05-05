extends Resource
class_name Terrain

export var name = ""

export (PackedScene) var Base_Tile
export (Resource) var road

var seedling = seed(VarStore.world_seed)

var regular =  [
		[
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "]
		
		]
	]


var other = []


var special = []


var rare= []


var location= {}


var tileRef = {}
var patterned = false

func Get_Tile(T):
	return tileRef[T]

func pat():
	pass


func Get_Pattern(x,y):
	#seedling = seed(VarStore.world_seed * x + y)
	if not patterned:
		pat()
	var i = rand_range(0, len(regular))
	return regular[i]
