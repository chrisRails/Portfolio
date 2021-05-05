extends Terrain
class_name Urban_Terrain



export (PackedScene) var house
export (PackedScene) var store
export (PackedScene) var inn
export (PackedScene) var Tree_Park
export (PackedScene) var Flower_Park
export (PackedScene) var Park
export (PackedScene) var Bush
export (PackedScene) var Market


#["#","#","#","#","#","#","#","#"],
#["#"," "," "," ","#"," "," "," "],
#["#"," "," "," ","#"," "," "," "],
#["#"," "," "," ","#"," "," "," "],
#["#","#","#","#","#","#","#","#"],
#["#"," "," "," ","#"," "," "," "],
#["#"," "," "," ","#"," "," "," "],
#["#"," "," "," ","#"," "," "," "]

func pat():
	
	tileRef = {
		"t":Tree_Park,
		"P":Park,
		"b":Bush,
		"f":Flower_Park
	}
	
	regular = [
	[
		["#","#","#","#","#","#","#","#",],
		["#","H","H","H","#","B","B","B",],
		["#","H"," ","H","#","B"," ","B",],
		["#","H","H","H","#","B","B","B",],
		["#","#","#","#","#","#","#","#",],
		["#","B","B","B","#","H","H","H",],
		["#","B"," ","B","#","H"," ","H",],
		["#","B","B","B","#","H","H","H",]
		
	]
	
]
	other = [
		[ # Park
			["#","#","#","#","#","#","#","#"],
			["#","B","B","B","#","B","B","B"],
			["#","B","+","+","+","+","+","B"],
			["#","B","+","t","P","t","+","B"],
			["#","#","+","P","f","P","+","#"],
			["#","B","+","t","P","t","+","B"],
			["#","B","+","+","+","+","+","B"],
			["#","B","B","B","#","B","B","B"]
		
		],[ # Market
			["#","#","#","#","#","#","#","#"],
			["#","S","S","S","#","S","S","S"],
			["#","S","$","$","#","$","$","S"],
			["#","S","$","#","#","#","$","S"],
			["#","#","#","#","t","#","#","#"],
			["#","S","$","#","#","#","$","S"],
			["#","S","$","$","#","$","$","S"],
			["#","S","S","S","#","S","S","S"]
		
		],[ # Straight Block A
			["#","#","#","#","#","#","#","#"],
			["#","H","B","B","#","B","B","H"],
			["#","H","t","B","#","I","t","H"],
			["#","H","f","B","#","S","f","H"],
			["#","H","P","I","#","S","P","H"],
			["#","H","f","B","#","S","f","H"],
			["#","H","t","B","#","I","t","H"],
			["#","H","B","B","#","B","B","H"]
		
		],[ # Straight Block B
			["#","#","#","#","#","#","#","#"],
			["#","H","H","H","H","H","H","H"],
			["#","B","t","f","P","f","t","B"],
			["#","B","B","B","I","B","B","B"],
			["#","#","#","#","#","#","#","#"],
			["#","B","I","S","S","S","I","B"],
			["#","B","t","f","P","f","t","B"],
			["#","H","H","H","H","H","H","H"]
		
		]
	]
	special = [
		[ # Res-Block
			["#","#","#","#","#","#","#","#"],
			["#","B","H","#","t","#","H","B"],
			["#","B","H","#","t","#","H","B"],
			["#","B","H","#","t","#","H","B"],
			["#","B","H","#","f","#","H","B"],
			["#","B","H","#","#","#","H","B"],
			["#","B","H","H","H","H","H","B"],
			["#","B","B","B","B","B","B","B"]
		
		],[ # Plaza
			["#","#","#","#","#","#","#","#"],
			["#","#","#","#","#","I","B","B"],
			["#","#","t","#","#","S"," ","H"],
			["#","#","#","#","#","H","H","H"],
			["#","#","#","#","#","#","#","#"],
			["#","I","S","H","#","H","H","H"],
			["#","B"," ","H","#","H"," ","H"],
			["#","B","H","H","#","H","H","H"]
		
		]
	]


func Get_Tile(T):
	var ty
	if T == "H":
		#for variations
		ty = house
	elif T == "S":
		#for variations
		ty = store
	elif T == "I":
		#for variations
		ty = inn
	elif T == "B":
		var roll = randi() % 10
		if roll < 4:
			ty = house
		elif roll < 8:
			ty = store
		elif roll < 10:
			ty = inn
		#for variations
	elif T == "$":
		#for variations
		ty = Market
	else:
		ty = tileRef[T]
	return ty




func Get_Pattern(x, y, loc = ""):
	seed(VarStore.world_seed * x * y)
	if not patterned:
		pat()
	if loc == "":
		var roll = (randi() % 10) 
		if roll <= 3:
			var i = rand_range(0, len(regular))
			return regular[i]
		elif roll <= 7:
			var i = rand_range(0, len(other))
			return other[i]
		elif roll <= 9:
			var i = rand_range(0, len(special))
			return special[i]
		else:
			var i = rand_range(0, len(rare))
			return rare[i]
	elif loc != "":
		# Location stuff
		return location[loc]
		pass



	


