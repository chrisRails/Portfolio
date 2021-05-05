extends Spatial

var playerspawn
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func seter(return_co,s):
	$Door/Sprite3D/StaticBody.send_to = return_co
	$Door2/Sprite3D/StaticBody.send_to = return_co
	

func set_trans(y):
	translate(Vector3(0,y,0))
	playerspawn = $Door/Sprite3D/StaticBody/PlayerSpawn.get_global_transform().origin
	
