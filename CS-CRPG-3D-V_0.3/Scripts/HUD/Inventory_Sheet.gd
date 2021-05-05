extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	VarStore.InventoryStore = self
	#var items = Loader.getDat("Items")
	#$Panel/ItemList.reg_items(items)
	pass

func equipToggle(item, index):
	var itemdat
	if item.type == "Armor":
		itemdat = $Panel/inv_Holder.item_info(item, index)
		if $Panel/inv_Holder.A_list[itemdat[1]].equiped:
			$Panel/inv_Holder.A_list[itemdat[1]].equiped = false
		else:
			$Panel/inv_Holder.A_list[itemdat[1]].equiped = true
	elif item.type == "Weapon":
		itemdat = $Panel/inv_Holder.item_info(item, index)
		if $Panel/inv_Holder.W_list[itemdat[1]].equiped:
			$Panel/inv_Holder.W_list[itemdat[1]].equiped = false
		else:
			$Panel/inv_Holder.W_list[itemdat[1]].equiped = true
		pass
	elif item.type == "Item":
		itemdat = $Panel/inv_Holder.item_info(item, index)
		if $Panel/inv_Holder.I_list[itemdat[1]].equiped:
			$Panel/inv_Holder.I_list[itemdat[1]].equiped = false
		else:
			$Panel/inv_Holder.I_list[itemdat[1]].equiped = true
		pass
	elif item.type == "Ammo":
		itemdat = $Panel/inv_Holder.item_info(item, index)
		if $Panel/inv_Holder.R_list[itemdat[1]].equiped:
			$Panel/inv_Holder.R_list[itemdat[1]].equiped = false
		else:
			$Panel/inv_Holder.R_list[itemdat[1]].equiped = true
		pass
	elif item.type == "Consumable":
		itemdat = $Panel/inv_Holder.item_info(item, index)
		if $Panel/inv_Holder.C_list[itemdat[1]].equiped:
			$Panel/inv_Holder.C_list[itemdat[1]].equiped = false
		else:
			$Panel/inv_Holder.C_list[itemdat[1]].equiped = true
		pass
	$Panel/inv_Holder.refresh()
	pass

func addItem(thing):
	$Panel/inv_Holder.reg(thing)
func addItems(things):
	for thing in things:
		addItem(thing)

func setCarryCap(weight):
	$Panel/inv_Holder.max_weight = weight

func removeItem(ind,num):
	$Panel/inv_Holder.removeitem(ind,num)


func changeCat(newCat):
	$Panel/inv_Holder.catChange(newCat)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
