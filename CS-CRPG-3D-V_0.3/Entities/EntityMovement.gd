extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dist
var view
var view2
var pos
# Called when the node enters the scene tree for the first time.
func _ready():
	view = (VarStore.view_radius)
	view2 = (view * view * view) * 5
	pass # Replace with function body.
var inWorld = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if inWorld:
		$KinematicBody/Sprite3D.self_rot = self.rotation_degrees.y
		if $KinematicBody.pop:
			queue_free()
		pos = $KinematicBody.get_global_transform().origin
		dist = pos.distance_squared_to(VarStore.PlayerStore.vec3)
		#print(str(pos) + " - " + str(dist) + " - " + str(view2))
		if dist > view2:
			inWorld = false
			queue_free()
	
	
func set_trans(x,z):
	pos = Vector3(x,0,z)
	translate(pos)
	inWorld = true
	
