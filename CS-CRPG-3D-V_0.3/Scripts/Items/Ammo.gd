extends Base_Item
class_name Ammo


func _init():
	pass # Replace with function body.
func action():
	pass


export var damageMin = 0
export var damageMax = 0
export var subType = ""
export var material = ""
export var dist = 0 # Range

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


func GenerateAmmo(rank):
	pass
func GenerateEffect(rank):
	pass
func GetAmmo(name):
	pass
func GetEffect(name):
	pass


