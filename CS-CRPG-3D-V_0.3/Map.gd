extends Spatial
class_name Map

var location_type
var cells = []
var celDat = [] # [ x, y, terrain ]
var tiles = []
var tile_dict = {}
var location_name = ""
var biome
var neighbors = []
var worldRef
var sublocations = []
var size = 0
var fullsize = 0
var halfsize = 0

var gen = false #toggle for if stored


func GenarateMap(Size, worl, bio, mapnum, seed_adjustment): # [ num, world, biome selfnum]
	VarStore.prinTime("Map Gen Start")
	VarStore.world_seed = VarStore.world_seed + (seed_adjustment*10)
	if mapnum == 0:
		neighbors = [1]
	else:
		neighbors = [0]
	size = Size
	biome = VarStore.biomes[VarStore.biomelist[bio]]
	print(biome.name)
	celDat = biome.Get_Map(size, "Town")
	fullsize = len(celDat)
	halfsize = int((fullsize) / 2)
	worldRef = worl
	var temp
	cells.resize(fullsize)
	tick = 0
	VarStore.loading.set_end(fullsize)
	

var c = load("SubCell.tscn")
var temp
var tick = float('inf')
var tick2 = float('inf')
func _process(delta):
	if tick < fullsize:
		cells[tick] = []
		cells[tick].resize(fullsize)
		for w in range(0,8):
			tiles.append([])
			tiles[(tick*8)+w].resize(fullsize * 8)
		for j in range(0, fullsize):
			temp = biome.Get_Cell(celDat[tick][j])
			cells[tick][j] = DS_Cell.new(temp, [tick - halfsize, j - halfsize], (fullsize)-1)
			Tile_Celler(cells[tick][j], tick ,j)
		VarStore.prinTime("Map Gen cycle")
		tick += 1
		VarStore.loading.stepDone()
	elif tick == fullsize:
		tick += 1
		VarStore.loading.set_end(fullsize)
	else:
		if tick2 < fullsize:
			for j in range(0,fullsize):
				temp = c.instance()
				temp.build(self, cells[tick2][j], tick2, j)
				self.add_child(temp)
				temp.set_trans(tick2-(size*4),j-(size*4))
			VarStore.prinTime("Build Map End")
			tick2 +=1
			VarStore.loading.stepDone()
		elif tick2 == fullsize:
			tick2 += 1
			worldRef.readyMap()

func Tile_Celler(cell, i, j):
	i = i * 8
	j = j * 8
	var a
	for x in range(0, 8):
		for y in range(0, 8):
			a = cell.tiles[x][y]
			tiles[i + x][j + y] = a
			pass
	pass
	
func buildMap():
	VarStore.prinTime("Build Map Start")
	var c = load("SubCell.tscn")
	var temp
	tick2 = 0
	VarStore.loading.set_end(fullsize)



func road_logic_cell_getter(x,y):
	return cells[x][y]


var interior = null

func interior_set(inte, y_level):
	if interior != null:
		interior.queue_free()
	interior = inte
	
	self.add_child(interior)
	interior.set_trans(y_level)
	return interior.playerspawn
	pass



