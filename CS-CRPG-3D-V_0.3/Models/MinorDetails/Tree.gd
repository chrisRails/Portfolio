extends InterfaceBase


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var drop
var IID
var TPos
# Called when the node enters the scene tree for the first time.
func _ready():
	IID = VarStore.ItemObj
	drop = Consumable.new()
	drop.GetConsumable("Apple")
	TPos = get_global_transform().origin
	dropspots = [Vector3(TPos.x + 1,2.5,TPos.z + 1),Vector3(TPos.x + -1, 2.5, TPos.z + -1), Vector3(TPos.x + -1,2.5,TPos.z + 1), Vector3(TPos.x + 1,2.5,TPos.z + -1)]
	#drop =  {"count":1,"type":"consumable","typeIndex":2,"name":"Apple","tags":{"icon":304,"subtype":"","known":false,"value":5,"description":""},"weight":0,"effects":[],"consumable_type":"","subtypeI":-1,"expiration":10,"duration":0}
	pass # Replace with function body.

var dropspots # = [Vector3(1,2.5,1),Vector3(-1, 2.5, -1), Vector3(-1,2.5,1), Vector3(1,2.5,-1)]

func event():
	var tileN = IID.instance()
	tileN.set_item(drop)
	var dp =dropspots[randi()%4]
	tileN.set_trans(dp.x,dp.y,dp.z)
	VarStore.WorldStore.addItem(tileN)
	#emit_signal("ItemDrop", tileN)
	#add_child(tileN)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
