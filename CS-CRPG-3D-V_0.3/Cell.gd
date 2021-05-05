extends Spatial
class_name Cell

var tiles = []
var MapRef : Map
var subcellName = ""
var pos: Vector3
var posT
var gened = false
var hidden = true
var terrain
var thread
var X
var Y


func _process(delta):
	if not gened:
	#check range to player, hide or show rows if needed
		posT = pos.distance_squared_to(VarStore.PlayerStore.vec3)
		if posT < 50000:
			place()
			gened = true
	pass

var row

func build(map, cell, x, y):
	X = x
	Y = y
	terrain = cell.terrain
	MapRef = map
	row = cell.tiles
	gen(terrain, row)

func gen(terrain, rows):
	$Row1.gen(rows[0], self, terrain, 1)
	$Row2.gen(rows[1], self, terrain, 2)
	$Row3.gen(rows[2], self, terrain, 3)
	$Row4.gen(rows[3], self, terrain, 4)
	$Row5.gen(rows[4], self, terrain, 5)
	$Row6.gen(rows[5], self, terrain, 6)
	$Row7.gen(rows[6], self, terrain, 7)
	$Row8.gen(rows[7], self, terrain, 8)

func place():
	$Row1.place()
	$Row2.place()
	$Row3.place()
	$Row4.place()
	$Row5.place()
	$Row6.place()
	$Row7.place()
	$Row8.place()
	pass

func get_neighbor_cell(x = 0, y = 0):
	return MapRef.road_logic_cell_getter(X+x, Y+y)

func sync_pos():
	var tran = self.get_global_transform()
	pos = tran.origin



func set_trans(X, Y):
	translate(Vector3(X*80 ,0,Y*80))
	var tran = self.get_global_transform()
	pos = tran.origin
