extends DungeonBase


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func config(tile, dun, level, x, y): # Neighbors[Nor, Eas, Sou, Wes]
	var neighbors = [
				dun.dungeon[level][x][y-1],
				dun.dungeon[level][x+1][y],
				dun.dungeon[level][x][y+1],
				dun.dungeon[level][x-1][y]]
	
	if "#" in neighbors[1]:
		$Nor.frame = 0
		$Nor/wall/CollisionShape.disabled = false
	elif "+" in neighbors[1]:
		$Nor.frame = 3
		pass
		
	if "#" in neighbors[2] :
		$Eas.frame = 0
		$Eas/wall/CollisionShape.disabled = false
	elif "+" in neighbors[2]:
		$Eas.frame = 3
		pass
		
	if "#" in neighbors[3]:
		$Sou.frame = 0
		$Sou/wall/CollisionShape.disabled = false
	elif "+" in neighbors[3]:
		$Sou.frame = 3
		pass
		
	if "#" in neighbors[0]:
		$Wes.frame = 0
		$Wes/wall/CollisionShape.disabled = false
	elif "+" in neighbors[0]:
		$Wes.frame = 3
		pass
	
	if "t" in tile:
		$Tourch.show()
	
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
