extends Base_Item
class_name Weapon


func _init():
	pass # Replace with function body.

func action():
	pass


export var damageMin = 0
export var damageMax = 0
export var attackBonus = 0
export var reach = 0
export var subType = ""
export var material = ""
export var attackSpeed = 0

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



func GenerateWeapon(rank):
	pass
func GenerateEffect(rank):
	pass
func GetWeapon(name):
	pass
func GetEffect(name):
	pass


