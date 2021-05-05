extends Resource
class_name Biome


export var name = ""


# The Basics

export (Resource) var road
export (Resource) var river
export (PackedScene) var Bridge

# The Terrains

export (Resource) var Plains
export (Resource) var Hills
export (Resource) var Detail_Heavy
export (Resource) var Lake
export (Resource) var Ocean
export (Resource) var Urban
export (Resource) var Agriculture
export (Resource) var Mountanous
export (Resource) var Valley
export (Resource) var Canyon
export (Resource) var Riverland
export (Resource) var Coastal
export (Resource) var Highlands
export (Resource) var Pond
export (Resource) var Fast_Travel_Zone
export (Resource) var Blank

var terrains = {}
var bo = true

# Sound



# Music



# Patterns



var patterns = [
	[
		["X","X","X"],
		["X","*","X"],
		["X","X","X"]
	],
	[
		["X","X","X","X","X"],
		["X"," "," "," ","X"],
		["X"," ","*"," ","X"],
		["X"," "," "," ","X"],
		["X","X","X","X","X"]
	],
	[
		["X","X","X","X","X","X","X"],
		["X"," "," "," "," "," ","X"],
		["X"," "," "," "," "," ","X"],
		["X"," "," ","*"," "," ","X"],
		["X"," "," "," "," "," ","X"],
		["X"," "," "," "," "," ","X"],
		["X","X","X","X","X","X","X"]
	],
	[
		["X","X","X","X","X","X","X","X","X"],
		["X"," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," ","X"],
		["X"," "," ","*","*","*"," "," ","X"],
		["X"," "," ","*","*","*"," "," ","X"],
		["X"," "," ","*","*","*"," "," ","X"],
		["X"," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," ","X"],
		["X","X","X","X","X","X","X","X","X"]
	],
	[
		["X","X","X","X","X","X","X","X","X","X","X"],
		["X"," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," ","*","*","*"," "," "," ","X"],
		["X"," "," "," ","*","*","*"," "," "," ","X"],
		["X"," "," "," ","*","*","*"," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," ","X"],
		["X","X","X","X","X","X","X","X","X","X","X"]
	],
	[
		["X","X","X","X","X","X","X","X","X","X","X","X","X"],
		["X"," "," "," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," ","*","*","*"," "," "," "," ","X"],
		["X"," "," "," "," ","*","*","*"," "," "," "," ","X"],
		["X"," "," "," "," ","*","*","*"," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," "," "," ","X"],
		["X"," "," "," "," "," "," "," "," "," "," "," ","X"],
		["X","X","X","X","X","X","X","X","X","X","X","X","X"],
	],
]


func Get_Map(size, mapType, terr1 = "F", Loc = "U"):
	if bo:
		terrains = {
		"U": Urban,
		"F": Plains,
		"A": Agriculture,
		"M": Mountanous,
		"H": Hills,
		"V": Valley,
		"D": Detail_Heavy,
		"C": Canyon,
		"R": Riverland,
		"O": Coastal,
		"L": Lake,
		"X": Fast_Travel_Zone,
		"B": Blank
		}
		bo == false
	var map = patterns[size]
	var maplen = len(map)
	var mapf = []
	var row1 = []
	var row2 = []
	var row3 = []
	for i in range(0, maplen):
		row1 = []
		row2 = []
		row3 = []
		for j in range(0,maplen):
			if map[i][j] == " ":
				row1.append(terr1)
				row1.append(terr1)
				row1.append(terr1)
				
				row2.append(terr1)
				row2.append(terr1)
				row2.append(terr1)
				
				row3.append(terr1)
				row3.append(terr1)
				row3.append(terr1)
			elif map[i][j] == "*":
				row1.append(Loc)
				row1.append(Loc)
				row1.append(Loc)
				
				row2.append(Loc)
				row2.append(Loc)
				row2.append(Loc)
				
				row3.append(Loc)
				row3.append(Loc)
				row3.append(Loc)
			elif map[i][j] == "X":
				if i == 0 and j == 0:
					row1 += ["X"]
				elif i == maplen -1 and j == 0:
					row1 += ["X"]
				elif i == 0 and j == maplen-1:
					row1 += ["X"]
				elif i == maplen-1 and j == maplen-1:
					row1 += ["X"]
				elif j == 0 or j == maplen-1:
					row1 += ["X"]
					row2 += ["X"]
					row3 += ["X"]
				elif i == 0 or i == maplen-1:
					row1 += ["X","X","X"]
		if row1 != []:
			mapf.append(row1)
		if row2 != []:
			mapf.append(row2)
		if row3 != []:
			mapf.append(row3)
	print(mapf)
	return mapf


# Cell Getter
func Get_Cell(t):
	if t == "*":
		pass
	else:
		return terrains[t]
	pass
