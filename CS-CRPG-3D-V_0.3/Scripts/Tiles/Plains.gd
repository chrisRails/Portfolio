extends Terrain
class_name Plains_Terrain



export (PackedScene) var tree
export (PackedScene) var Grass
export (PackedScene) var Rock
export (PackedScene) var Flower
export (PackedScene) var Bush
export (PackedScene) var Dungeon_Entrance
export (PackedScene) var Dungeon_Entrance_Large




func pat():
	tileRef = {
		"t":tree,
		"r":Rock,
		"b":Bush,
		"f":Flower,
		"d":Dungeon_Entrance,
		"D":Dungeon_Entrance_Large,
	}
	
	
	regular = [
	[
		[" "," "," "," "," "," "," "," "],
		[" "," "," "," "," "," "," "," "],
		[" "," ","t"," "," "," "," "," "],
		[" "," "," "," "," "," "," "," "],
		[" "," "," "," "," "," "," "," "],
		[" "," "," "," "," "," "," "," "],
		[" "," "," "," "," "," ","t"," "],
		[" "," "," "," "," "," "," "," "]
		
	]
]
	other = [
		[
			[" ","t"," "," "," "," ","t"," "],
			[" "," "," "," "," "," "," "," "],
			[" ","t","t"," ","t"," "," "," "],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," ","t"," ","t"],
			[" "," ","t","t"," "," "," "," "],
			["t"," "," "," "," "," ","t"," "],
			[" "," "," "," ","t"," "," "," "]
			
		]
	]


	special = [
		[
			[" ","t"," "," "," "," ","t"," "],
			["t"," "," ","t"," ","t"," ","t"],
			[" ","t","t"," ","t"," "," "," "],
			["t"," "," ","t"," "," ","t"," "],
			[" ","t"," "," ","t","t"," ","t"],
			[" "," ","t","t"," "," "," "," "],
			["t"," ","t"," ","t","t","t"," "],
			[" "," "," "," ","t","t"," ","t"]
			
		]
	]


	rare= [
		[
		[" "," "," "," "," "," "," "," "],
		[" "," "," "," ","#"," "," "," "],
		[" "," ","t"," ","#"," "," "," "],
		[" "," "," "," ","#","#","#"," "],
		[" "," "," "," ","#"," ","#"," "],
		[" "," "," "," ","#","#","#"," "],
		[" "," "," "," ","#"," ","t"," "],
		[" "," "," "," "," "," "," "," "]
			
		],
		[
		[" "," "," "," "," "," "," "," "],
		[" ","t"," "," ","t","t"," "," "],
		[" "," ","b"," ","t","d","t"," "],
		[" ","t"," "," "," ","#","t"," "],
		[" "," "," ","t"," ","#"," "," "],
		[" "," "," ","#","#","#"," "," "],
		[" ","b","t","#"," "," ","t"," "],
		[" "," "," ","#"," "," "," "," "]
			
		],
		[
		[" "," "," "," "," "," "," "," "],
		[" "," "," "," "," ","t"," "," "],
		[" "," ","t"," ","D"," "," "," "],
		[" "," "," "," ","#"," "," "," "],
		[" ","t"," "," ","#"," "," "," "],
		[" "," "," "," ","#"," "," "," "],
		[" "," ","t"," ","#","t"," "," "],
		[" "," "," "," ","#"," "," "," "]
			
		]
	]


	location= {}



func Get_Pattern(x, y, loc = ""):
	seed(VarStore.world_seed * x + y)
	if not patterned:
		pat()
	if loc == "":
		var roll = (randi() % 10) 
		var roll2 = (randi() % 10) 
		if roll <= 4:
			if roll2 <= 5:
				var i = rand_range(0, len(regular))
				return regular[i]
			else:
				return PlainsGen()
		elif roll <= 7:
			var i = rand_range(0, len(other))
			return other[i]
		elif roll <= 8:
			var i = rand_range(0, len(special))
			return special[i]
		else:
			var i = rand_range(0, len(rare))
			return rare[i]
	else:
		# Location stuff
		return location[loc]
		pass


func PlainsGen():
	var pat = []
	var t = " "
	var roll
	for i in range(0,8):
		pat.append([])
		for j in range(0,8):
			roll = (randi() % 10)
			if roll <= 2:
				t = "t"
			elif roll <= 4:
				t = "b"
			elif roll <= 6:
				t = "r"
			elif roll <= 8:
				t = "f"
			pat[i].append(t)
	return pat
	
	pass





