extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



var W_list = []
var A_list = []
var I_list = []
var C_list = []
var Q_list = []
var O_list = []
var M_list = []
var items = []



var active = 'weapon'
var Aindex


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


func reg_items(list):
	for item in list:
		add(item)


func reg(item):
	if item['type'] == 'weapon':
		W_list.append(item)
	elif item['type'] == 'armor':
		A_list.append(item)
	elif item['type'] == 'consumable':
		I_list.append(item)
	elif item['type'] == 'item':
		C_list.append(item)
	elif item['type'] == 'quest':
		Q_list.append(item)
	elif item['type'] == 'currency':
		O_list.append(item)
	elif item['type'] == 'other':
		M_list.append(item)


func add_items(list):
	for item in list:
		add(item)


func add(item):
	if item['type'] == 'weapon':
		$ItemList.add_item(str_const(item), VarStore.icons[item['tags']['icon']])
	elif item['type'] == 'armor':
		$ItemList.add_item(str_const(item), VarStore.icons[item['tags']['icon']])
	elif item['type'] == 'consumable':
		$ItemList.add_item(str_const(item), VarStore.icons[item['tags']['icon']])
	elif item['type'] == 'item':
		$ItemList.add_item(str_const(item), VarStore.icons[item['tags']['icon']])
	elif item['type'] == 'quest':
		$ItemList.add_item(str_const(item), VarStore.icons[item['tags']['icon']])
	elif item['type'] == 'currency':
		$ItemList.add_item(str_const(item), VarStore.icons[item['tags']['icon']])
	elif item['type'] == 'other':
		$ItemList.add_item(str_const(item), VarStore.icons[item['tags']['icon']])


func removeitem(index):
	if active == 'weapon':
		W_list.remove(index)
	elif active == 'armor':
		A_list.remove(index)
	elif active == 'consumable':
		C_list.remove(index)
	elif active == 'item':
		I_list.remove(index)
	elif active == 'quest':
		Q_list.remove(index)
	elif active == 'currency':
		M_list.remove(index)
	elif active == 'other':
		O_list.remove(index)
	items_recal()
	refresh()


func str_const(item):
	if item['type'] == 'weapon':
		return item['name'] + "  -  " + item['weapon_type'] + " - " + str(item['weight']) + ' lb  -  ' + str(item['count'])
	elif item['type'] == 'armor':
		return item['name'] + "  -  " + item['armor_type'] + "  - " + str(item['weight']) + ' lb  -  ' + str(item['count'])
	elif item['type'] == 'consumable':
		return item['name'] + "  -  " + item['consumable_type'] + "  " + str(item['weight']) + ' lb  -  ' + str(item['count'])
	elif item['type'] == 'item':
		return item['name'] + "  -  " + item['item_type'] + "  - " + str(item['weight']) + ' lb  -  ' + str(item['count'])
	elif item['type'] == 'quest':
		return item['name'] + "  -  " + item['quest'] + "  -  " + str(item['weight']) + ' lb  -  ' + str(item['count'])
	elif item['type'] == 'currency':
		# + "  -  " + str(item['source'])
		return item['name'] + '  -  ' + str(item['count'])
	elif item['type'] == 'other':
		return item['name'] + "  -  " + item['other_type'] + "  - " + str(item['weight']) + ' lb  -  ' + str(item['count'])


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func refresh():
	$ItemList.clear()
	if active == 'weapon':
		add_items(W_list)
	elif active == 'armor':
		add_items(A_list)
	elif active == 'consumable':
		add_items(C_list)
	elif active == 'item':
		add_items(I_list)
	elif active == 'quest':
		add_items(Q_list)
	elif active == 'currency':
		add_items(C_list)
	elif active == 'other':
		add_items(O_list)


func _on_Catagory_item_selected(index):
	active = ndex[index]
	refresh()

var ndex = ["weapon", 'armor', 'item', 'consumable', 'quest', 'currency', 'other']
var focus
func _on_ItemList_item_selected(index):
	Aindex = index
	var item
	if active == 'weapon':
		item = W_list[index]
	elif active == 'armor':
		item = A_list[index]
	elif active == 'consumable':
		item = C_list[index]
	elif active == 'item':
		item = I_list[index]
	elif active == 'quest':
		item = Q_list[index]
	elif active == 'currency':
		item = M_list[index]
	elif active == 'other':
		item = O_list[index]
	focus = item


