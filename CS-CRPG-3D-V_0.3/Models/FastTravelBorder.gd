extends InterfaceBase


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	fast_travel = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func action():
	VarStore.HUDStore.add_child(HudStore.fast_travel_question.instance())

