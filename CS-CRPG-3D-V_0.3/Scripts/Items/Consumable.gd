extends Base_Item
class_name Consumable


func _init():
	type = "consumable"
	
	# Calculate expiration from duration
	

func action():
	pass


enum sub {Food, Potion, Scroll}
export var subType = ""
export var duration = 0
var expiration = 0

func type():
	return type


func GenerateConsumable(rank):
	pass
func GenerateEffect(rank):
	pass
func GetConsumable(it):
	var item = load("Items/Consumable/"+ it + ".tres")
	icon = item.icon
	name = item.name
	icon_I = item.icon_I
	value = item.value
	weight = item.weight
	desc = item.desc
	known = item.known
	EffectList = item.EffectList
	subType = item.subType
	duration = item.duration
	
func GetEffect(name):
	pass
