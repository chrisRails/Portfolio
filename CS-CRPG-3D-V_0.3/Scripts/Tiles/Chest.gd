extends "res://Scripts/Tiles/Action.gd"

export (PackedScene) var item
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	Q = true
	IID = item
	drop = Armor.new()
	drop.GetArmor("Leather_Chestplate")
	TPos = get_global_transform().origin
	pass # Replace with function body.

var drop
var IID
var TPos
var dropspots
export var type = ''
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
var open = false

func event():
	#anim = true
	TPos = get_global_transform().origin
	$AnimatedSprite3D.stop()
	if open:
		print("chest close")
		$AnimatedSprite3D.play(type + "Close")
		open = false
	else:
		print("chest open")
		$AnimatedSprite3D.play(type)
		var tileN = IID.instance()
		tileN.set_item(drop)
		var dp = Vector3(TPos.x,TPos.y + 0.5,TPos.z)
		tileN.set_trans(dp.x,dp.y,dp.z)
		VarStore.WorldStore.addItem(tileN)
		
		open = true



