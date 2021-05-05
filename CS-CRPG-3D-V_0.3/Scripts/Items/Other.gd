class_name Other
extends Base_Item

func _init():
	pass # Replace with function body.
func action():
	pass


export var material = ""
export var subtype = ""

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
