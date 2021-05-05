extends Base_Item
class_name Armor


func _init():
	type = "armor"
func action():
	pass
enum mat {Leather, Iron, Steel, Mythril, Chain}
enum sub {Head, Body, Legs, Boots, Cape, Belt, Shield}
export var ACBonus = 0
export var damageRes = 0
export var subType = ""
export var material = ''

func icon():
	return icon_I
func weight():
	return weight
func type():
	return type
func count(num = 0):
	count += num
	return count
func name():
	return name
func typeI():
	return type


func GenerateArmor(rank):
	pass
func GenerateEffect(rank):
	pass
func GetArmor(name):
	var item = load("Items/Armor/"+ name + ".tres")
	icon = item.icon
	name = item.name
	icon_I = item.icon_I
	value = item.value
	weight = item.weight
	desc = item.desc
	known = item.known
	EffectList = item.EffectList
	subType = item.subType
	ACBonus = item.ACBonus
	damageRes = item.damageRes
	material = item.material
func GetEffect(name):
	pass
