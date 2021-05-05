extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var item
var index
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func Set_Item(item_, index_):
	index = index_
	item = item_
	self.icon = item.icon_I
	

func Remove_Item():
	item = null
	index = null
	self.icon = null


func _pressed():
	VarStore.InfoBookStore.newPage({'type' : 'item',
	'cat': item.type,
	'ind': index,
	'name' : item.name,
	'desc' : item.desc,
	'icon' : item.icon_I,
	'stats' : item_info(),
	'Item' : item
	})

func item_info():
	var re = ''
	var IT = item.type()
	if IT == 'weapon':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'Attack Bonus : ' + str(item.attackBonus) + "\n" 
		re +=  'Damage Min : ' + str(item.damageMin)  + "\n" 
		re +=  'Damage Max : ' + str(item.damageMax)  + "\n" 
		re +=  'Range : ' + str(item.reach )+ "\n" 
		re +=  "Attack Speed : " + str(item.attack_speed) + "\n" 
		re +=  'Weight : ' + str(item.weight/10) + '-lb' + "\n" 
	elif IT == 'armor':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'AC Bonus : ' + str(item.ACBonus) + "\n" 
		re +=  'Damage Reduction : ' + str(item.damageRes) + "\n"
		re +=  'Weight : ' + str(item.weight/10) + '-lb' + "\n"
	elif IT == 'ammo':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'Damage Min : ' + str(item.damageMin)  + "\n" 
		re +=  'Damage Max : ' + str(item.damageMax)  + "\n" 
		re +=  'Range : ' + str(item.dist )+ "\n" 
		re +=  'Weight : ' + str(item.weight/10) + '-lb' + "\n" 
	elif IT == 'item':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'Weight : ' + str(item.weight/10) + '-lb' + "\n" 
	if item.EffectList() != null:
		re += 'Effects : \n' + effect_str(item.EffectList())
	return re
	
	
	


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
