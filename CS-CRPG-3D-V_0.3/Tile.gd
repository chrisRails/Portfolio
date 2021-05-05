extends Spatial


var x = 0
var y = 0
var cell
var tile
var detail
var absX
var absY
var terr
var t
var blank = false

var dat = {
	"":""
}

func gen(T, cel, Terr, co):
	t = T
	terr = Terr
	x = co[0]
	y = co[1]
	cell = cel
	if terr.name =="Border":
		if t in ["1", "2", "3", "4"]:
			self.tile = terr.border_corner.instance()
			self.add_child(self.tile)
			if t == "1":
				self.tile.rotate_y(deg2rad(-90))
				pass
			elif t == "2":
				pass
			elif t == "3":
				self.tile.rotate_y(deg2rad(180))
				pass
			elif t == "4":
				self.tile.rotate_y(deg2rad(90))
				pass
		elif t in ["|", "-", "_", "I"]:
			self.tile = terr.border.instance()
			self.add_child(self.tile)
			if t == "|":
				self.tile.rotate_y(deg2rad(90))
			elif t == "I":
				self.tile.rotate_y(deg2rad(-90))
			elif t == "_":
				self.tile.rotate_y(deg2rad(180))
		else:
			self.tile = terr.Base_Tile.instance()
			self.add_child(self.tile)
			
	elif terr.name == "Blank":
		blank = true
	else:
		self.tile = terr.Base_Tile.instance()
		if t == " ":
			pass
		elif t in  ["#", "+"]:
			road_Logic()
		else:
			detail = terr.Get_Tile(t)
	#VarStore.prinTime("Tile Gened")


func place():
	if terr.name =="Border":
		pass
	else:
		self.add_child(tile)
	if detail != null:
		detail = detail.instance()
		if t in ["B", "I", "S", "H"]:
			building_logic()
		if t == "t" and terr.name == "Plains":
			detail.gen((x*VarStore.world_seed)+y)
		self.add_child(detail)
	#VarStore.prinTime("Tile Built")


func road_Logic():
	var north = false
	var south = false
	var east = false
	var west = false
	var n
	if x == 1:
		n = cell.get_neighbor_cell(0, -1)
		if n.tiles[7][y-1] in  ["#", "+"]:
			west = true
		pass
	elif cell.row[x-2][y-1] in  ["#", "+"]: #West
		west = true
	
	if x == 8:
		n = cell.get_neighbor_cell(0, 1)
		if n.tiles[0][y-1] in  ["#", "+"]:
			east = true
		pass
	elif cell.row[x][y-1] in  ["#", "+"]: #East
		east = true
	
	if y == 1:
		n =cell.get_neighbor_cell( -1)
		if n.tiles[x-1][7] in  ["#", "+"]:
			north = true
		pass
	elif cell.row[x-1][y-2] in  ["#", "+"]: #North
		north = true
	
	if y == 8:
		n =cell.get_neighbor_cell( 1)
		if n.tiles[x-1][0] in  ["#", "+"]:
			south = true
		pass
	elif cell.row[x-1][y] in  ["#", "+"]: #South
		south = true
	
	
	if north and south and east and west:
		self.add_child(terr.road.Way4.instance())
	
	elif north and south and east:
		n= terr.road.Way3.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(90))
	elif north and south and west:
		n= terr.road.Way3.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(-90))
	elif north and west and east:
		n= terr.road.Way3.instance()
		self.add_child(n)
	elif west and south and east:
		n= terr.road.Way3.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(180))
	
	elif north and east:
		n= terr.road.Turn.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(-90))
	elif south and east:
		n= terr.road.Turn.instance()
		self.add_child(n)
	elif south and west:
		n= terr.road.Turn.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(90))
	elif north and west:
		n= terr.road.Turn.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(180))
	
		
	elif north and south:
		n= terr.road.Straight.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(90))
	elif east and west:
		n= terr.road.Straight.instance()
		self.add_child(n)
	
	elif north:
		n= terr.road.End.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(-90))
	elif south:
		n= terr.road.End.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(90))
	elif east:
		n= terr.road.End.instance()
		self.add_child(n)
	elif west:
		n= terr.road.End.instance()
		self.add_child(n)
		n.rotate_y(deg2rad(180))
		
		
		
	pass


func building_logic():
	# roads
	var north = false
	var south = false
	var east = false
	var west = false
	# priority
	var np = false
	var sp = false
	var ep = false
	var wp = false
	
	var n
	var c
	if x == 1:
		n = cell.get_neighbor_cell(0, -1)
		if n.tiles[7][y-1] in  ["#", "+"]:
			west = true
			if n.tiles[7][y-1] == "+":
				wp = true
		pass
	elif cell.row[x-2][y-1] in  ["#", "+"]: #West
		west = true
		if cell.row[x-2][y-1] == "+":
			wp = true
	
	if x == 8:
		n = cell.get_neighbor_cell(0, 1)
		if n.tiles[0][y-1] in  ["#", "+"]:
			east = true
			if n.tiles[0][y-1] == "+":
				ep = true
		pass
	elif cell.row[x][y-1] in  ["#", "+"]: #East
		east = true
		if cell.row[x][y-1] == "+":
			ep = true
	
	if y == 1:
		n =cell.get_neighbor_cell( -1)
		if n.tiles[x-1][7] in  ["#", "+"]:
			north = true
			if n.tiles[x-1][7] == "+":
				np = true
		pass
	elif cell.row[x-1][y-2] in  ["#", "+"]: #North
		north = true
		if cell.row[x-1][y-2] == "+":
			np = true
	
	if y == 8:
		n =cell.get_neighbor_cell( 1)
		if n.tiles[x-1][0] in  ["#", "+"]:
			if n.tiles[x-1][0] == "+":
				sp = true
			south = true
		pass
	elif cell.row[x-1][y] in  ["#", "+"]: #South
		south = true
		if cell.row[x-1][y] == "+":
			sp = true
	

	if np:
		detail.rotate_y(deg2rad(-90))
	elif sp:
		detail.rotate_y(deg2rad(90))
	elif ep:
		pass
	elif wp:
		detail.rotate_y(deg2rad(180))
		
	else:
		if north:
			detail.rotate_y(deg2rad(-90))
		elif south:
			detail.rotate_y(deg2rad(90))
		elif east:
			pass
		elif west:
			detail.rotate_y(deg2rad(180))
		else:
			detail.queue_free()
			var roll = randi() % 4
			if roll == 2:
				detail = terr.Get_Tile("f").instance()
			elif roll == 3:
				detail = terr.Get_Tile("P").instance()
			else:
				detail = terr.Get_Tile("t").instance()

