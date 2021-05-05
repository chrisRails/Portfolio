extends Spatial
class_name G_World


var maplist = [] #store the map data structs
var mapDetail = [] # [ num, size, biome ]
var pathdict = {}
var worldmap
var Name = ""
var currentMap
var cmNum = 0

func _ready():
	var temp = load("res://Loading Screen.tscn")
	VarStore.loading = temp.instance()
	self.add_child(VarStore.loading)
	VarStore.WorldStore = self
	VarStore.GridStore = $Ground_Layer
	GenarateWorld(2)
	pass # Replace with function body.


func GenarateWorld(Wnum): # 1
	var temap
	var m = load("Map.tscn")
	print("Map Loaded")
	for i in range(0, Wnum):
		print("Map: " + str(i) + " Genaration")
		temap = m.instance()
		maplist.append(temap)
	currentMap = maplist[0]
	cmNum = 0
	add_child(currentMap)
	currentMap.GenarateMap(1, self, 0, 0, 0) # size, self, biome_id

 
func nextPhase(): # 2
	currentMap.buildMap()


func readyMap(): # 3
	print("Spawning main map")
	VarStore.PlayerStore.GRAVITY = -20
	VarStore.loading.queue_free()
	pass


func MapChange(oldnum):
	var temp = load("res://Loading Screen.tscn")
	VarStore.loading = temp.instance()
	self.add_child(VarStore.loading)
	VarStore.PlayerStore.GRAVITY = 0
	currentMap.queue_free()
	
	
	var m = load("Map.tscn")
	currentMap = m.instance()
	add_child(currentMap)
	currentMap.GenarateMap(1, self, 0, 0, oldnum + 1) # size, self, biome_id
	nextPhase()


func addItem(thing):
	add_child(thing)
