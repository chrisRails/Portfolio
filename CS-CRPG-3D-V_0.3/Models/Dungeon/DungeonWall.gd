extends InterfaceBase


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var send_to = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func setup(re):
	Q = true
	send_to = re


func event():
	var spawn
	spawn = send_to.origin
	
	print(spawn)
	VarStore.PlayerStore.Move_Player(spawn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
