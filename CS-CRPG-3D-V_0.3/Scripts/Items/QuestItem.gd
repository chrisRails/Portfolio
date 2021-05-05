extends Base_Item
class_name Quest_Item


func _ready():
	pass # Replace with function body.
func action():
	pass


export var quest = ""
export var subtype = ""
export var questID = 0

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



func GenerateOther(rank):
	pass
func GetOther(name):
	pass
