extends Spatial
class_name DungeonBase


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func set_trans(x,y,z):
	print(str(x) + " : " + str(y) + " : " + str(z))
	set_transform(Transform( Vector3(1, 0, 0), Vector3(0, 1, 0), Vector3(0, 0, 1), Vector3(x,y,z)))
	print(self.get_global_transform().origin)
