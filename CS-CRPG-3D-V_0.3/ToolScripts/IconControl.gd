extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_IconNum_text_changed(new_text):
	var iNum = int(new_text)
	if iNum in range(1,1023):
		$Icon.texture = VarStore.icons[iNum]


func _on_Icon_Down_pressed():
	var num = int($IconNum.text)
	num -= 1
	if num in range(1,1024):
		var j
		if num < 10:
			j = ("00" + str(num))
		elif num < 100:
			j = ("0" + str(num))
		else:
			j = str(num)
		$IconNum.text = j
	else:
		$IconNum.text = "1023"
	$Icon.texture = VarStore.icons[int($IconNum.text)]

func _on_Icon_Up_pressed():
	var num = int($IconNum.text)
	num += 1
	if num in range(1,1024):
		var j
		if num < 10:
			j = ("00" + str(num))
		elif num < 100:
			j = ("0" + str(num))
		else:
			j = str(num)
		$IconNum.text = j
	else:
		$IconNum.text = "001"
	$Icon.texture = VarStore.icons[int($IconNum.text)]
