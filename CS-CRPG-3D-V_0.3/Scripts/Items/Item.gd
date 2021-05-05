extends Resource
class_name Base_Item

export var name = ""
export var type = ""
export (int) var icon = 0 # Legacy _____DO NOT USE_____
export(Texture) var icon_I 
export (int) var value = 0
export (int) var weight = 0
export var desc = ""
export var known = true
export (int) var count = 1
export var EffectList = []
export var equiped = false
export var ID = ""
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

var E_Elements = {
	"Bonus" : ["Junp","XP Bonus","MP Bonus","HP Bonus","AC Bonus","Body Bonus","Mind Bonus","Senses Bonus","Speed Bonus", "Attack Bonus", "Damage Bonus", "Skill Bonus", "Damage Reduction"], 
	"Elemental":["Light","Fire", "Ice", "Acid", "Earth", "Light", "Water", "Shadow", "Holy", "Air", "Nature", "Sand", "Dust", "Stone", "Metel", "Energy", "Force", "Fungus", "Spike"],
	"Effect":["Glow", "Polymorph", "Charm", "Blind", "Intoxicate", "Underwter Breathing", "Posion", "Stun", "Pin", "Slashing", "Peircing", "Bleed", "Sleep", "Shield"],
	"Healing" : ["Healing","Regen"]
}
var E_Ranges = ["Personal","Defffense","Line", "Target", "Cone", "Line", "Burst Local", "Burst Ranged", "Area Local", "Area Ranged"]
var E_Types = ["Active","Passive","Activated Passive"]

func EffectList():
	return EffectList
func GenPersonal(rank):
	pass
func GenTarget(rank):
	pass
func GenBurst(rank):
	pass
func GenWand(rank):
	pass
func GetPersonal(namex):
	pass
func GetTarget(namex):
	pass
func GetBurst(namex):
	pass
func GetWand(namex):
	pass
func GetSpecial(namex):
	pass
func NewEffect():
	var effect = {
		"Element":"",
		"Type":"",
		"Range":"",
		"RangeAmount":0,
		"Num":0,
		"Per":0,
		"Chance":0,
		"Name":""
	}
	return effect



#
#class Base_Item extends Resource:
#	func action():
#		pass
#
#
#	# Item vars
#	export var name = ""
#	export var type = ""
#	export (int) var icon = 0 # Legacy _____DO NOT USE_____
#	export(Texture) var icon_I 
#	export (int) var value = 0
#	export (int) var weight = 0
#	export var desc = ""
#	export var known = true
#	export (int) var count = 1
#
#	func icon():
#		return icon_I
#	func weight():
#		return weight
#	func type():
#		return type
#	func count(num = 0):
#		count += num
#		return count
#	func name():
#		return name
#	export var EffectList = []
#
#
#class Weapon extends Base_Item:
#	func _init():
#		pass # Replace with function body.
#
#	func action():
#		pass
#
#
#	export var damageMin = 0
#	export var damageMax = 0
#	export var attackBonus = 0
#	export var reach = 0
#	export var subType = ""
#	export var material = ""
#	export var attackSpeed = 0
#
#	func icon():
#		return icon_I
#	func weight():
#		return weight
#	func type():
#		return type
#	func count(num = 0):
#		count += num
#		return count
#	func name():
#		return name
#	func typeI():
#		return type
#
#
#
#	func GenerateWeapon(rank):
#		pass
#	func GenerateEffect(rank):
#		pass
#	func GetWeapon(name):
#		pass
#	func GetEffect(name):
#		pass
#
#
#class Armor extends Base_Item:
#	func _init():
#		pass # Replace with function body.
#	func action():
#		pass
#
#
#	export var ACBonus = 0
#	export var damageRes = 0
#	export var subType = ""
#	export var material = ""
#
#	func icon():
#		return icon_I
#	func weight():
#		return weight
#	func type():
#		return type
#	func count(num = 0):
#		count += num
#		return count
#	func name():
#		return name
#	func typeI():
#		return type
#
#
#	func GenerateArmor(rank):
#		pass
#	func GenerateEffect(rank):
#		pass
#	func GetArmor(name):
#		pass
#	func GetEffect(name):
#		pass
#
#
#class E_Item extends Base_Item:
#
#	func _ready():
#		pass # Replace with function body.
#
#	func action():
#		pass
#
#
#	export var subType = ""
#	export var material = ""
#
#	func icon():
#		return icon_I
#	func weight():
#		return weight
#	func type():
#		return type
#	func count(num = 0):
#		count += num
#		return count
#	func name():
#		return name
#	func typeI():
#		return type
#
#
#
#	func GenerateE_Item(rank):
#		pass
#	func GenerateEffect(rank):
#		pass
#	func GetE_Item(name):
#		pass
#	func GetEffect(name):
#		pass
#
#
#class Consumable extends Base_Item:
#	func _ready():
#		type = "consumable"
#		pass # Replace with function body.
#
#	func action():
#		pass
#
#	export var subType = ""
#	export var duration = 0
#
#	func type():
#		return type
#
#	func GenerateConsumable(rank):
#		pass
#
#	func GenerateEffect(rank):
#		pass
#
#	func GetConsumable(name):
#		var item = load("Items/Consumable/"+ name + ".tres")
#		icon = item.icon
#		name = item.name
#		icon_I = item.icon_I
#		value = item.value
#		weight = item.weight
#		desc = item.desc
#		known = item.known
#		EffectList = item.EffectList
#		subType = item.subType
#		duration = item.duration
#
#	func GetEffect(name):
#		pass
#
#
#class Ammo extends Base_Item:
#	func _ready():
#		pass # Replace with function body.
#	func action():
#		pass
#
#
#	export var damageMin = 0
#	export var damageMax = 0
#	export var subType = ""
#	export var material = ""
#	export var dist = 0 # Range
#
#	func icon():
#		return icon_I
#	func weight():
#		return weight
#	func type():
#		return type
#	func count(num = 0):
#		count += num
#		return count
#	func name():
#		return name
#	func typeI():
#		return type
#
#
#	func GenerateAmmo(rank):
#		pass
#	func GenerateEffect(rank):
#		pass
#	func GetAmmo(name):
#		pass
#	func GetEffect(name):
#		pass
#
#
#class Quest_Item extends Base_Item:
#	func _ready():
#		pass # Replace with function body.
#	func action():
#		pass
#
#
#	export var quest = ""
#	export var subtype = ""
#	export var questID = 0
#
#	func icon():
#		return icon_I
#	func weight():
#		return weight
#	func type():
#		return type
#	func count(num = 0):
#		count += num
#		return count
#	func name():
#		return name
#	func typeI():
#		return type
#
#
#
#	func GenerateOther(rank):
#		pass
#	func GetOther(name):
#		pass
#
#
#class Other extends Base_Item:
#	func _ready():
#		pass # Replace with function body.
#	func action():
#		pass
#
#
#	export var material = ""
#	export var subtype = ""
#
#	func icon():
#		return icon_I
#	func weight():
#		return weight
#	func type():
#		return type
#	func count(num = 0):
#		count += num
#		return count
#	func name():
#		return name
#	func typeI():
#		return type
#
#
#
#	func GenerateOther(rank):
#		pass
#	func GetOther(name):
#		pass
#
#
#class Currency extends Base_Item:
#	func _ready():
#		pass
#
#	func action():
#		pass
#
#
#
#	export var source = ""
#
#	func icon():
#		return icon_I
#	func weight():
#		return weight
#	func type():
#		return type
#	func count(num = 0):
#		count += num
#		return count
#	func name():
#		return name
#	func typeI():
#		return type
#
#
#	func GetCurrency(name):
#		pass
#

