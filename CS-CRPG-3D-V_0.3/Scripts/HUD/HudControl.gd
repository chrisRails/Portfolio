extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	VarStore.HUDStore = self
	$HUD.show()
	$Inventory.hide()
var side = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_HUD_Switch"):
		if side == 0:
			$HUD.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			$Inventory.show()
			$Inventory/InvSheet/Inventory_Sheet/Panel/inv_Holder.refresh()
			side = 1
		elif side == 1:
			$Inventory.hide()
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			$HUD.show()
			side = 0


func _on_Button_pressed():
	VarStore.exit1 = true
	VarStore.WorldStore.queue_free()
