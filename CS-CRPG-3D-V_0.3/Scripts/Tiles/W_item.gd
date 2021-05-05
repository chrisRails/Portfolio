extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pos
var inWorld = false
var dist
var view
var view2

func _ready():
	view = (VarStore.view_radius)
	view2 = (view * view * view) * 5


var Q = true

func set_trans(x,y,z):
	pos = Vector3(x,y,z)
	translate(pos)
	inWorld = true
	
func _process(_delta):
	if inWorld == true:
		if $RigidBody.pop:
			queue_free()
			inWorld = false
		pos = $RigidBody.get_global_transform().origin
		dist = pos.distance_squared_to(VarStore.PlayerStore.vec3)
		#print(str(pos) + " - " + str(dist) + " - " + str(view2))
		if dist > view2:
			inWorld = false
			queue_free()


func set_item(item):
	$RigidBody.weight = item.weight()
	$RigidBody.item = item
	$RigidBody/Sprite3D.texture = item.icon()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
