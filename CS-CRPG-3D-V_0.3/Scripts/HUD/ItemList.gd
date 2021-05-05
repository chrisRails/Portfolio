extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# ToDo Redo Script to include new item properties

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	$Stats/Weight.text = str(weight/100)
		

func hide_all():
	$Weapons.hide()
	$Armor.hide()
	$Item.hide()
	$Ammo.hide()
	$Consumable.hide()
	$Other.hide()
	$Quest.hide()
	$Currency.hide()


func catChange(cat):
	active = cat
	refresh()
	hide_all()
	if active == 'weapon':
		$Weapons.show()
	elif active == 'armor':
		$Armor.show()
	elif active == 'consumable':
		$Consumable.show()
	elif active == 'item':
		$Item.show()
	elif active == 'quest':
		$Quest.show()
	elif active == 'currency':
		$Currency.show()
	elif active == 'other':
		$Other.show()
	elif active == 'ammo':
		$Ammo.show()


var items = []
var W_list = [] #Weapon
var A_list = [] #Armor
var I_list = [] #Equipable Item
var C_list = [] #Consumable
var Q_list = [] #Quest
var O_list = [] #Other
var M_list = [] #Currancy
var R_list = [] #Ammo

var weight = 0
var max_weight = 100

var active = 'weapon'

func reg_items(list):
	for item in list:
		var type = item.type()
		print(item)
		print(item.type())
		if type == 'weapon':
			W_list.append(item)
		elif type == 'armor':
			A_list.append(item)
		elif type == 'consumable':
			C_list.append(item)
		elif type == 'item':
			I_list.append(item)
		elif type == 'quest':
			Q_list.append(item)
		elif type == 'currency':
			M_list.append(item)
		elif type == 'other':
			O_list.append(item)
		elif type == 'ammo':
			R_list.append(item)
	refresh()


func reg(item):
	weight += item.weight()
	var type = item.type()
	print(item)
	print(item.type())
	if type == 'weapon':
		W_list.append(item)
	elif type == 'armor':
		A_list.append(item)
	elif type == 'consumable':
		C_list = searchList(C_list,item)
	elif type == 'item':
		I_list.append(item)
	elif type == 'quest':
		Q_list = searchList(Q_list,item)
	elif type == 'currency':
		M_list = searchList(M_list,item)
	elif type == 'other':
		O_list = searchList(O_list,item)
	elif type == 'ammo':
		R_list = searchList(R_list,item)
	refresh()


func searchList(list, thing):
	var index = 0
	for th in list:
		if th.name() == thing.name():
			list[index].count(thing.count())
			return list
		index += 1
	list.append(thing)
	return list


func add_items(list):
	for item in list:
		add(item)


func add(item):
	var IT = item.type()
	if IT == 'weapon':
		$Weapons.add_item(str_const(item),item.icon())
	elif IT == 'armor':
		$Armor.add_item(str_const(item),item.icon())
	elif IT == 'consumable':
		$Consumable.add_item(str_const(item),item.icon())
	elif IT  == 'item':
		$Item.add_item(str_const(item),item.icon())
	elif IT  == 'quest':
		$Quest.add_item(str_const(item),item.icon())
	elif IT  == 'currency':
		$Currancy.add_item(str_const(item),item.icon())
	elif IT  == 'other':
		$Other.add_item(str_const(item),item.icon())
	elif IT  == 'ammo':
		$Ammo.add_item(str_const(item),item.icon())


func removeitem(index, num):
	var item
	if active == 'weapon':
		item = W_list[index]
		if item.count <= num:
			W_list.remove(index)
			VarStore.InfoBookStore.clear()
		else:
			W_list[index].count(-num)
	elif active == 'armor':
		item = A_list[index]
		if item.count <= num:
			A_list.remove(index)
			VarStore.InfoBookStore.clear()
		else:
			A_list[index].count(-num)
	elif active == 'consumable':
		item = C_list[index]
		if item.count <= num:
			C_list.remove(index)
			VarStore.InfoBookStore.clear()
		else:
			C_list[index].count(-num)
	elif active == 'item':
		item = I_list[index]
		if item.count <= num:
			I_list.remove(index)
			VarStore.InfoBookStore.clear()
		else:
			I_list[index].count(-num)
	elif active == 'quest':
		item = Q_list[index]
		if item.count <= num:
			Q_list.remove(index)
			VarStore.InfoBookStore.clear()
		else:
			Q_list[index].count(-num)
	elif active == 'currency':
		item = M_list[index]
		if item.count <= num:
			M_list.remove(index)
			VarStore.InfoBookStore.clear()
		else:
			M_list[index].count(-num)
	elif active == 'other':
		item = O_list[index]
		if item.count <= num:
			O_list.remove(index)
			VarStore.InfoBookStore.clear()
		else:
			O_list[index].count(-num)
	elif active == 'ammo':
		item = R_list[index]
		if item.count <= num:
			R_list.remove(index)
			VarStore.InfoBookStore.clear()
		else:
			R_list[index].count(-num)
	items_recal()
	refresh()


func Use(item):
	pass


func getInfo(item_name, cat, index):
	if cat == 'weapon':
		if W_list[index].name == item_name:
			return [W_list[index],index]
		else:
			while index != 0:
				index -= 1
				if W_list[index].name == item_name:
					return [W_list[index],index]
		pass
	elif cat == 'armor':
		if A_list[index].name == item_name:
			return [A_list[index],index]
		else:
			while index != 0:
				index -= 1
				if A_list[index].name == item_name:
					return [A_list[index],index]
		pass
	elif cat == 'consumable':
		if C_list[index].name == item_name:
			return [C_list[index],index]
		else:
			while index != 0:
				index -= 1
				if C_list[index].name == item_name:
					return [C_list[index],index]
		pass
	elif cat  == 'item':
		if I_list[index].name == item_name:
			return [I_list[index],index]
		else:
			while index != 0:
				index -= 1
				if I_list[index].name == item_name:
					return [I_list[index],index]
		pass
	elif cat  == 'quest':
		if Q_list[index].name == item_name:
			return [Q_list[index],index]
		else:
			while index != 0:
				index -= 1
				if Q_list[index].name == item_name:
					return [Q_list[index],index]
		pass
	elif cat == 'currency':
		if M_list[index].name == item_name:
			return [M_list[index],index]
		else:
			while index != 0:
				index -= 1
				if M_list[index].name == item_name:
					return [M_list[index],index]
		pass
	elif cat  == 'other':
		if O_list[index].name == item_name:
			return [O_list[index],index]
		else:
			while index != 0:
				index -= 1
				if O_list[index].name == item_name:
					return [O_list[index],index]
		pass
	elif cat  == 'ammo':
		if R_list[index].name == item_name:
			return [R_list[index],index]
		else:
			while index != 0:
				index -= 1
				if R_list[index].name == item_name:
					return [R_list[index],index]
	pass
	#return a list with the item info, and the updated index

func find_use(item_name, cat, index):
	if cat == 'consumable':
		if C_list[index].name == item_name:
			Use(C_list[index])
			removeitem(index, 1)
		else:
			while index != 0:
				index -= 1
				if C_list[index].name == item_name:
					Use(C_list[index])
					removeitem(index, 1)
					index = 0
		pass
	elif cat  == 'item':
		if I_list[index].name == item_name:
			Use(I_list[index])
			removeitem(index, 1)
		else:
			while index != 0:
				index -= 1
				if I_list[index].name == item_name:
					Use(I_list[index])
					removeitem(index, 1)
					index = 0
		pass


func items_recal():
	items = []
	for item in W_list:
		items.append(item)
	for item in A_list:
		items.append(item)
	for item in I_list:
		items.append(item)
	for item in C_list:
		items.append(item)
	for item in Q_list:
		items.append(item)
	for item in O_list:
		items.append(item)
	for item in M_list:
		items.append(item)
	for item in R_list:
		items.append(item)	


func invOffload():
	var Items = []
	for item in W_list:
		Items.append(item)
	for item in A_list:
		Items.append(item)
	for item in I_list:
		Items.append(item)
	for item in C_list:
		Items.append(item)
	for item in Q_list:
		Items.append(item)
	for item in O_list:
		Items.append(item)
	for item in M_list:
		Items.append(item)
	for item in R_list:
		Items.append(item)
	return Items


func str_const(item):
	var IT = item.type()
	var eq = ""
	if item.equiped:
		eq = "Equiped"
	if IT == 'weapon':
		return  str(item.count()) + "  " + item.name() + "   " + item.subType + "  " + str(item.weight()/10) + '-lb    ' + eq
	elif IT == 'armor':
		return str(item.count()) + "  " +item.name() + "   " + item.subType + "  " + str(item.weight()/10) + '-lb    '  + eq
	elif IT == 'consumable':
		return str(item.count()) + "  " + item.name() + "   " + item.subType + "  " + str(item.weight()/10) + '-lb    '
	elif IT == 'item':
		return str(item.count()) + "  " +item.name() + "   " + item.subType + "  " + str(item.weight()/10) + '-lb    ' + eq
	elif IT == 'quest':
		return str(item.count()) + "  " +item.name() + "   " + item.quest + "   " + str(item.weight()/10) + '-lb    '
	elif IT == 'currency':
		return str(item.count()) + "  " +item.name + "   " + str(item.source)
	elif IT == 'other':
		return str(item.count()) + "  " +item.name() + "   " + item.subType + "  " + str(item.weight()/10) + '-lb    '
	elif IT == 'ammo':
		return str(item.count()) + "  " +item.name() + "   " + item.subType + "  " + str(item.weight()/10) + '-lb    ' + eq


func item_info(item):
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
	elif IT == 'consumable':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Expiration : ' + str(item.expiration) + "\n" 
		re +=  'Weight : ' + str(item.weight/10) + '-lb' + "\n" 
	elif IT == 'item':
		re += 'Type : ' + str(item.subType) + "\n" 
		re +=  'Material : ' + str(item.material) + "\n" 
		re +=  'Weight : ' + str(item.weight/10) + '-lb' + "\n" 
	elif IT == 'quest':
		re += 'Related Quest : ' + str(item['quest'])
		re +=  'Weight : ' + str(item.weight/10) + '-lb' + "\n" 
	elif IT == 'currency':
		re += 'Source : ' + str(item.source) + "\n" 
	elif IT == 'other':
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


func _on_ItemList_item_activated(index, cat):
	var item
	if cat == 'weapon':
		item = W_list[index]
	elif cat == 'armor':
		item = A_list[index]
	elif cat == 'consumable':
		item = C_list[index]
	elif cat == 'item':
		item = I_list[index]
	elif cat == 'quest':
		item = Q_list[index]
	elif cat == 'currency':
		item = M_list[index]
	elif cat == 'other':
		item = O_list[index]
	elif cat == 'ammo':
		item = R_list[index]
	VarStore.InfoBookStore.newPage({
	'type' : 'item',
	'cat': cat,
	'ind': index,
	'name' : item.name,
	'desc' : item.desc,
	'icon' : item.icon_I,
	'stats' : item_info(item),
	'Item' : item
	})


func refresh():
	$Stats/Weight.text = str(weight)
	$Stats/Weight2.text = str(max_weight)
	if active == 'weapon':
		$Weapons.clear()
		add_items(W_list)
	elif active == 'armor':
		$Armor.clear()
		add_items(A_list)
	elif active == 'consumable':
		$Consumable.clear()
		add_items(C_list)
	elif active == 'item':
		$Item.clear()
		add_items(I_list)
	elif active == 'quest':
		$Quest.clear()
		add_items(Q_list)
	elif active == 'currency':
		$Currency.clear()
		add_items(M_list)
	elif active == 'other':
		$Other.clear()
		add_items(O_list)
	elif active == 'ammo':
		$Ammo.clear()
		add_items(R_list)


func _on_trash_pressed():
	
	pass # Replace with function body.


func _on_Weapons_item_activated(index):
	_on_ItemList_item_activated(index, 'weapon')


func _on_Armor_item_activated(index):
	_on_ItemList_item_activated(index, 'armor')


func _on_Item_item_activated(index):
	_on_ItemList_item_activated(index,'item')


func _on_Ammo_item_activated(index):
	_on_ItemList_item_activated(index, 'ammo')


func _on_Consumable_item_activated(index):
	_on_ItemList_item_activated(index,'consumable')


func _on_Other_item_activated(index):
	_on_ItemList_item_activated(index, 'other')


func _on_Quest_item_activated(index):
	_on_ItemList_item_activated(index, 'quest')


func _on_Currancy_item_activated(index):
	_on_ItemList_item_activated(index, 'currency')


func _on_Weapons_item_selected(index):
	_on_ItemList_item_activated(index,"weapon")


func _on_Armor_item_selected(index):
	_on_ItemList_item_activated(index,"armor")


func _on_Item_item_selected(index):
	_on_ItemList_item_activated(index,"item")


func _on_Ammo_item_selected(index):
	_on_ItemList_item_activated(index,"ammo")


func _on_Consumable_item_selected(index):
	_on_ItemList_item_activated(index,"consumable")


func _on_Other_item_selected(index):
	_on_ItemList_item_activated(index,"other")


func _on_Quest_item_selected(index):
	_on_ItemList_item_activated(index,"quest")


func _on_Currency_item_selected(index):
	_on_ItemList_item_activated(index,"currency")
