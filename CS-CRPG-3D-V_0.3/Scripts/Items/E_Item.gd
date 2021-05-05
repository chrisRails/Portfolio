extends Base_Item
class_name E_Item


func _init():
	pass # Replace with function body.

func action():
	pass


export var subType = ""
export var material = ""

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



func GenerateE_Item(rank):
	pass
func GenerateEffect(rank):
	pass
func GetE_Item(name):
	pass
func GetEffect(name):
	pass


