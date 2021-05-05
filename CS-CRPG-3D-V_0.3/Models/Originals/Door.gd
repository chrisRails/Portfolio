extends "res://Scripts/Tiles/Action.gd"


export (PackedScene) var Interior
export (int) var y_level = -20
export (bool) var is_exit = false

var send_to = Vector3()
var spawnhere = Vector3()
var s

# Called when the node enters the scene tree for the first time.
func _ready():
	var t = get_global_transform().origin
	s = t.x + VarStore.world_seed * t.z 
	
	Q = true
	
	pass # Replace with function body.


func event():
	
	var spawn
	spawnhere = $PlayerSpawn.get_global_transform()
	if is_exit:
		print("B")
		spawn = send_to.origin
		# deactivate any effects
	else:
		print("A")
		var inter = Interior.instance()
		inter.seter(spawnhere,s)
		
		spawn = VarStore.WorldStore.currentMap.interior_set(inter, y_level)
	print(spawn)
	VarStore.PlayerStore.Move_Player(spawn)
	
	
	
	
	pass


