extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (Resource) var item

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func setItem(in_item):
	item = in_item
	$PanelContainer/HBoxContainer/TextureRect.texture = item.icon()
	var IT = item.type()
	if IT == 'weapon':
		$PanelContainer/HBoxContainer/Label.text = item.name() + "   " + item.subType + "  " + str(item.weight()/10) + 'lb    ' + str(item.count())
	elif IT == 'armor':
		$PanelContainer/HBoxContainer/Label.text =  item.name() + "   " + item.subType + "  " + str(item.weight()/10) + 'lb    ' + str(item.count())
	elif IT == 'consumable':
		$PanelContainer/HBoxContainer/Label.text =  item.name() + "   " + item.subType + "  " + str(item.weight()/10) + 'lb    ' + str(item.count())
	elif IT == 'item':
		$PanelContainer/HBoxContainer/Label.text =  item.name() + "   " + item.subType + "  " + str(item.weight()/10) + 'lb    ' + str(item.count())
	elif IT == 'quest':
		$PanelContainer/HBoxContainer/Label.text =  item.name() + "   " + item.quest + "   " + str(item.weight()/10) + 'lb    ' + str(item.count())
	elif IT == 'currency':
		$PanelContainer/HBoxContainer/Label.text =  item.name + "   " + str(item.source) + '   ' + str(item.count())
	elif IT == 'other':
		$PanelContainer/HBoxContainer/Label.text =  item.name() + "   " + item.subType + "  " + str(item.weight()/10) + 'lb    ' + str(item.count())
	elif IT == 'ammo':
		$PanelContainer/HBoxContainer/Label.text =  item.name() + "   " + item.subType + "  " + str(item.weight()/10) + 'lb    ' + str(item.count())


func _on_Button_pressed():
	VarStore.book = {
	'type' : 'item',
	'name' : item.name,
	'desc' : item.desc,
	'icon' : item.icon_I,
	'stats' : item_info()
	}
	VarStore.book_change = true


func effect_str(effects):
	var re = ''
	for eff in effects:
		re += str(eff["Name"]) + ', ' + str(eff["Element"]) + ', ' + str(eff["Type"]) + ', ' + str(eff["Range"]) + "(" + str(eff["RangeAmmount"]) + ")"
		if eff["Num"] != 0:
			re+= ', ' + str(eff["Num"]) 
		if eff["Per"] != 0:
			re+=  ', ' + str(eff["Per"]) + "%" 
		re+=  ', Chance :' + str(eff["Chance"]) + '%' + "\n"
	return re


func item_info():
	var re = ''
	var IT = item.typeI()
	if IT == 'weapon':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'Attack Bonus : ' + str(item.attackBonus) + "\n" 
		re +=  'Damage Min : ' + str(item.damageMin)  + "\n" 
		re +=  'Damage Max : ' + str(item.damageMax)  + "\n" 
		re +=  'Range : ' + str(item.reach )+ "\n" 
		re +=  "Attack Speed : " + str(item.attack_speed) + "\n" 
		re +=  'Weight : ' + str(item.weight/10) + 'lb' + "\n" 
	elif IT == 'armor':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'AC Bonus : ' + str(item.ACBonus) + "\n" 
		re +=  'Damage Reduction : ' + str(item.damageRes) + "\n"
		re +=  'Weight : ' + str(item.weight/10) + 'lb' + "\n"
	elif IT == 'ammo':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'Damage Min : ' + str(item.damageMin)  + "\n" 
		re +=  'Damage Max : ' + str(item.damageMax)  + "\n" 
		re +=  'Range : ' + str(item.dist )+ "\n" 
		re +=  'Weight : ' + str(item.weight/10) + 'lb' + "\n" 
	elif IT == 'consumable':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Expiration : ' + str(item['expiration']) + "\n" 
		re +=  'Weight : ' + str(item.weight/10) + 'lb' + "\n" 
	elif IT == 'item':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'Weight : ' + str(item.weight/10) + 'lb' + "\n" 
	elif IT == 'quest':
		re += 'Related Quest : ' + str(item['quest'])
		re +=  'Weight : ' + str(item.weight/10) + 'lb' + "\n" 
	elif IT == 'currency':
		re += 'Source : ' + str(item.source) + "\n" 
	elif IT == 'other':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'Weight : ' + str(item.weight/10) + 'lb' + "\n" 
	if item.EffectList() != null:
		re += 'Effects : \n' + effect_str(item.EffectList())
	return re
