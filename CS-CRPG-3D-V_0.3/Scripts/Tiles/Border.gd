extends Terrain
class_name Border

export (Resource) var border
export (Resource) var border_corner

func pat():
	tileRef = {"-": border,
	"|": border,
	"_": border,
	"I": border,
	"1": border_corner ,
	"2": border_corner ,
	"3": border_corner ,
	"4": border_corner 
	}
	
	regular =  [
		[
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			["_","_","_","_","_","_","_","_"],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			["-","-","-","-","-","-","-","-"],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "]
		
		],[
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "]
		
		],[
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "],
			["_","_","1"," "," ","3","_","_"],
			[" "," "," "," "," "," "," "," "],
			[" "," "," "," "," "," "," "," "],
			["-","-","2"," "," ","4","-","-"],
			[" "," ","I"," "," ","|"," "," "],
			[" "," ","I"," "," ","|"," "," "]
		
		]
	]


func Get_Pattern(x, y, loc = ""): # use loc for max
	var half = int(loc/2)
	if not patterned:
		pat()
	if x == -half and y ==-half:
		return regular[2]
	elif x == -half and y==half:
		return regular[2]
	elif y == -half and x==half:
		return regular[2]
	elif y==half and x==half:
		return regular[2]
	elif y==half:
		return regular[0]
	elif y == -half:
		return regular[0]
	elif x==half:
		return regular[1]
	elif x == -half:
		return regular[1]



func Get_Tile(T):
	if not patterned:
		pat()
	return tileRef[T]


