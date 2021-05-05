extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var ability_num = 0
var ab_type = ''
var ability
var AB_ID

# Called when the node enters the scene tree for the first time.
func _ready():
	if ability_num >= 1 and ability_num <=6:
		ab_type = 'class'
		AB_ID = VarStore.classes[VarStore.player_cards['class']]['ability' + str(ability_num)]
	elif ability_num == 7 or ability_num == 8:
		ab_type = 'race'
		AB_ID = VarStore.races[VarStore.player_cards['race']]['ability' + str(ability_num - 6)]
	elif ability_num == 9 or ability_num == 10:
		ab_type = 'personality'
		AB_ID = VarStore.personalities[VarStore.player_cards['personality']]['ability' + str(ability_num - 8)]
	ability = VarStore.abilities[AB_ID]
	self.text = ability['Name']

	
func _pressed():
	VarStore.CharSheetStore.ABSelect(ability['Description'])




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
