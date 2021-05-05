extends DungeonBase


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var nDoor = false
var eDoor = false
var sDoor = false
var wDoor = false
var return_to = Vector3()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func config(tile, dun, level, x, y): # Neighbors[Nor, Eas, Sou, Wes]
	var neighbors = [
				dun.dungeon[level][x][y-1],
				dun.dungeon[level][x+1][y],
				dun.dungeon[level][x][y+1],
				dun.dungeon[level][x-1][y]]
	if tile == ">":
		
		$Nor.show()
		$Nor/StaticBody/CollisionShape.disabled = false
		$Nor.frame = 5
		$Eas.show()
		$Eas/StaticBody/CollisionShape.disabled = false
		$Eas.frame = 5
		$Sou.show()
		$Sou/StaticBody/CollisionShape.disabled = false
		$Sou.frame = 5
		$Wes.show()
		$Wes/StaticBody/CollisionShape.disabled = false
		$Wes.frame = 5
		
		
		if "+" in neighbors[0]:
			return "n"
		elif "." in neighbors[0]:
			return "n"
		if "+" in neighbors[1]:
			return "e"
		elif  "." in neighbors[1]:
			return "e"
		if "+" in neighbors[2]:
			return "s"
		elif  "." in neighbors[2]:
			return "s"
		if "+" in neighbors[3]:
			return "w"
		elif  "." in neighbors[3]:
			return "w"
		
		return 
		
	else:
		if "#" in neighbors[1] :
			$Nor.show()
			$Nor/StaticBody/CollisionShape.disabled = false
			$Nor.frame = 0
		elif "+" in neighbors[1]:
			$Nor.show()
			$Nor.frame = 3
			
		if "#" in neighbors[2]:
			$Eas.show()
			$Eas/StaticBody/CollisionShape.disabled = false
			$Eas.frame = 0
		elif "+" in neighbors[2]:
			$Eas.show()
			$Eas.frame = 3
			pass
			
		if "#" in neighbors[3]:
			$Sou.show()
			$Sou/StaticBody/CollisionShape.disabled = false
			$Sou.frame = 0
		elif "+" in neighbors[3]:
			$Sou.show()
			$Sou.frame = 3
			pass
			
		if "#" in neighbors[0]:
			$Wes.show()
			$Wes/StaticBody/CollisionShape.disabled = false
			$Wes.frame = 0
		elif "+" in neighbors[0]:
			$Wes.show()
			$Wes.frame = 3
			pass
		
	if "t" in tile:
		$Tourch.show()
	if "c" in tile:
		$Spatial.show()
		$Spatial/StaticBody/CollisionShape.disabled = false
		

func setup(re):
		$Nor/StaticBody.setup(re)
		$Eas/StaticBody.setup(re)
		$Sou/StaticBody.setup(re)
		$Wes/StaticBody.setup(re)
	
