extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	VarStore.PlayerStore.Mouse_Toggle()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_No_pressed():
	VarStore.PlayerStore.Mouse_Toggle()
	self.queue_free()
	pass # Replace with function body.


func _on_Yes_pressed():
	VarStore.PlayerStore.Mouse_Toggle()
	# yes to fast travel
	# Player Placement code goes here
	
	VarStore.PlayerStore.Move_Player(Vector3(0,1,0))
	VarStore.WorldStore.MapChange(VarStore.mapnum)
	self.queue_free()
	
	pass # Replace with function body.
