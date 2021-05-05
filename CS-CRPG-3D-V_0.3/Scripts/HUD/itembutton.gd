extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _pressed():
	VarStore.InventoryStore.changeCat(self.text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
