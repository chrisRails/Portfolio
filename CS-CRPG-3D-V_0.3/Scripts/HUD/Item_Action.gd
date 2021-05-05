extends RigidBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var pop = false
var fast_travel = false
var item
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var Q = true

func event():
	pop = true
	print(item)
	VarStore.InventoryStore.addItem(item.duplicate(true))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
