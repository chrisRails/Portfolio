extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	print("classes loaded")
	$Menu.show()
	$Item_Edit.hide()
	$"Load Item".hide()
	var Lfile = Loader.getDat("Items")
	print(Lfile)
	print('file loaded')
	if Lfile != null:
		$"Load Item".items = Lfile
		for item in Lfile:
			additem(item)
	print('items sorted')


func additem(item):
	if item["type"] == 'weapon':
		$"Load Item".W_list.append(item)
	elif item["type"] == 'armor':
		$"Load Item".A_list.append(item)
	elif item["type"] == 'consumable':
		$"Load Item".I_list.append(item)
	elif item["type"] == 'item':
		$"Load Item".C_list.append(item)
	elif item["type"] == 'quest':
		$"Load Item".Q_list.append(item)
	elif item["type"] == 'currency':
		$"Load Item".O_list.append(item)
	elif item["type"] == 'other':
		$"Load Item".M_list.append(item)


class Effect:

	var b_effect = {
		"element type": '',
		"effect type": '',
		"range type": '',
		"range amount": 0,
		"num": 0,
		"per": 0,
		"chance of effect": 0,
		"name" : '',
		"desc" : ''
	}


func save_file():
	Loader.saveDat("Items", $"Load Item".items)
	print('file saved')


func _on_New_pressed():
	$Menu.hide()
	$Item_Edit.show()
	$Item_Edit.Clear()


func _on_Exit_pressed():
	VarStore.exit1 = true
	queue_free()


func _on_Cancel_pressed():
	$Item_Edit.Clear()
	$Menu.show()
	$Item_Edit.hide()
	itemedit = false


func saveitemas(item, index):
	if item["type"] == 'weapon':
		$"Load Item".W_list[index] = (item)
	elif item["type"] == 'armor':
		$"Load Item".A_list[index] = (item)
	elif item["type"] == 'consumable':
		$"Load Item".I_list[index] = (item)
	elif item["type"] == 'item':
		$"Load Item".C_list[index] = (item)
	elif item["type"] == 'quest':
		$"Load Item".Q_list[index] = (item)
	elif item["type"] == 'currency':
		$"Load Item".O_list[index] = (item)
	elif item["type"] == 'other':
		$"Load Item".M_list[index] = (item)


func _on_Save_pressed():
	var item = $Item_Edit.save()
	if itemedit:
		saveitemas(item, itemindex)
		$"Load Item".items_recal()
		itemedit = false
	else:
		additem(item)
		$"Load Item".items.append(item)
		Loader.saveDat("Items", $"Load Item".items)
	$Menu.show()
	$Item_Edit.hide()

var itemedit = false
var itemindex
func _on_Load_Item_pressed():
	var item = $"Load Item".focus
	if item != {}:
		itemedit = true
		itemindex = $"Load Item".Aindex
		$Item_Edit.loadItem(item)
		$"Load Item".hide()
		$Item_Edit.show()


func _on_Load_pressed():
	$Menu.hide()
	$Item_Edit.hide()
	$"Load Item".refresh()
	$"Load Item".show()


func _on_Cancel_Load_pressed():
	$Menu.show()
	$Item_Edit.hide()
	$"Load Item".hide()
	itemedit = false


func _on_ItemList_nothing_selected():
	$"Load Item".focus = []


func _on_ItemList_item_activated(_index):
	var item = $"Load Item".focus
	if item != {}:
		itemedit = true
		itemindex = $"Load Item".Aindex
		$Item_Edit.loadItem(item)
		$"Load Item".hide()
		$Item_Edit.show()


func _on_Delete_Load_pressed():
	if $"Load Item".focus != {}:
		$"Load Item".removeitem($"Load Item".Aindex)
		save_file()
