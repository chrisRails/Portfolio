extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var focus

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func edit_effect(e):
	var ef = e[0]
	focus = e[1]
	$Element.text = ef["element type"]
	$Effect.text = ef["effect type"]
	$Range_Type.text = ef["range type"]
	$Range_Amount.text = str(ef["range amount"])
	$Num.text = str(ef["num"])
	$Per.text = str(ef["per"])
	$Chance_Effect.text = str(ef["chance of effect"])
	$Name.text = ef["name"]
	$Desc.text = ef["desc"]

func get_effect():
	var effect = {
		"element type": $Element.text,
		"effect type": $Effect.text,
		"range type": $Range_Type.text,
		"range amount": int($Range_Amount.text),
		"num": int($Num.text),
		"per": int($Per.text),
		"chance of effect": int($Chance_Effect.text),
		"name" : $Name.text,
		"desc" : $Desc.text
	}
	return effect
