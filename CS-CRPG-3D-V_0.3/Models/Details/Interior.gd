extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var playerspawn
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func seter(return_co,s):
	$Shop_Interior/Door/Sprite3D/StaticBody.send_to = return_co
	

func set_trans(y):
	translate(Vector3(0,y,0))
	playerspawn = $Shop_Interior/Door/Sprite3D/StaticBody/PlayerSpawn.get_global_transform().origin
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
