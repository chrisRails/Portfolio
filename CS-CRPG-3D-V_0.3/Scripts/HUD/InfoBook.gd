extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var skill = {
	"athletics":"How fast you can run",
	"acrobatics":"How high you can jump",
	"archana":"Skill with spell reaserch and using, crafting, and identifying magic items",
	"apraisal":"Skill at judging an items aproxamate value, helps in haggling",
	"crafting":"Skill at creating objects",
	"farming":"Skill with working the land, as well as animal checks",
	"fishing":"Skill with fishing",
	"forraging":"Skill with looking for food and supplies in the wild",
	"perception":"Skill with seeing farther", # ?????????????
	"stab":"Used for stabbing weapons",
	"shoot":"Used for shooting weapons",
	"slash":"Used for slashing weapons",
	"stealth":"How sneaky are you",
	"speach":"How good are you at convinsing others",
	"theif":"Picking pockets, lock picking, slight of hand, and stealing all fall under this skill"
}
var skill_icon = {
	"athletics":VarStore.icons[243],
	"acrobatics":VarStore.icons[241],
	"archana":VarStore.icons[128],
	"apraisal":VarStore.icons[011],
	"crafting":VarStore.icons[928],
	"farming":VarStore.icons[938],
	"fishing":VarStore.icons[864],
	"forraging":VarStore.icons[289],
	"perception":VarStore.icons[211],
	"stab":VarStore.icons[142],
	"shoot":VarStore.icons[189],
	"slash":VarStore.icons[176],
	"stealth":VarStore.icons[135],
	"speach":VarStore.icons[026],
	"theif":VarStore.icons[009]
}
# Called when the node enters the scene tree for the first time.
func _ready():
	VarStore.InfoBookStore = self
	$TextureRect/Item.hide()
	$TextureRect/Skill.show()
	pass # Replace with function body.
var dat_

func newPage(dat):
	dat_ = dat
	if dat['type'] == 'skill':
		$TextureRect/Skill/desc/Label.text = skill[dat['name']]
		$TextureRect/Skill/Icon.texture = skill_icon[dat['name']]
		$TextureRect/Skill/Name/Label.text = dat['name']
		$TextureRect/Skill/LV/Label.text =  "LV : " + str(VarStore.skill_lv[dat['name']])
		$TextureRect/Skill/XP/Label.text = "XP : " + str(VarStore.skill_XP[dat['name']]) + " / 100"
		$TextureRect/Skill.show()
		$TextureRect/Item.hide()
	if dat['type'] == 'item':
		$TextureRect/Item/desc/Label.text = dat['desc']
		$TextureRect/Item/Icon.texture = dat['icon']
		$TextureRect/Item/Name/Label.text = dat['name']
		$TextureRect/Item/stats/Label.text = dat['stats'] + "Equiped : " + str(dat["Item"].equiped)
		if dat["cat"] in ["quest","currency","other"]:
			$TextureRect/Item/VBoxContainer/equip.disabled = true
		else:
			$TextureRect/Item/VBoxContainer/equip.disabled = false
		
		if dat_['cat'] in ["weapon","armor","ammo","quest","currency","other"]:
			$TextureRect/Item/VBoxContainer/hotbar.disabled = true
		else:
			$TextureRect/Item/VBoxContainer/hotbar.disabled = false
		if dat["cat"] in ["quest","currency"]:
			$TextureRect/Item/VBoxContainer/trash.disabled = true
		else:
			$TextureRect/Item/VBoxContainer/trash.disabled = false
		$TextureRect/Item.show()
		$TextureRect/Skill.hide()


func clear():
	$TextureRect/Item.hide()
	$TextureRect/Skill.hide()

func recal():
	newPage(dat_)

func _on_equip_pressed():
	if dat_['cat'] in ["weapon","armor","item","ammo"]:
		if dat_["Item"].equiped:
			dat_["Item"].equiped = false
			if dat_['cat'] == "weapon":
				#VarStore.InventoryStore.equipToggle(dat_["Item"], dat_["ind"])
				VarStore.CharSheetStore.WeaponUnequip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "armor":
				#VarStore.InventoryStore.equipToggle(dat_["Item"], dat_["ind"])
				VarStore.CharSheetStore.ArmorUnequip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "item":
				#VarStore.InventoryStore.equipToggle(dat_["Item"], dat_["ind"])
				VarStore.CharSheetStore.ItemUnequip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "ammo":
				#VarStore.InventoryStore.equipToggle(dat_["Item"], dat_["ind"])
				VarStore.CharSheetStore.AmmoUnequip(dat_["Item"],dat_['ind'])
		else:
			dat_["Item"].equiped = true
			if dat_['cat'] == "weapon":
				#VarStore.InventoryStore.equipToggle(dat_["Item"], dat_["ind"])
				VarStore.CharSheetStore.WeaponEquip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "armor":
				#VarStore.InventoryStore.equipToggle(dat_["Item"], dat_["ind"])
				VarStore.CharSheetStore.ArmorEquip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "item":
				#VarStore.InventoryStore.equipToggle(dat_["Item"], dat_["ind"])
				VarStore.CharSheetStore.ItemEquip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "ammo":
				#VarStore.InventoryStore.equipToggle(dat_["Item"], dat_["ind"])
				VarStore.CharSheetStore.AmmoEquip(dat_["Item"],dat_['ind'])
	elif dat_['cat'] in ["consumable"]:
		# Use function
		VarStore.InventoryStore.removeItem(dat_['ind'],1)
	recal()
	
	pass # Replace with function body.


func _on_trash_pressed():
	if dat_["Item"].equiped:
			if dat_['cat'] == "weapon":
				VarStore.CharSheetStore.WeaponUnequip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "armor":
				VarStore.CharSheetStore.ArmorUnequip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "item":
				VarStore.CharSheetStore.ItemUnequip(dat_["Item"],dat_['ind'])
			elif dat_['cat'] == "ammo":
				VarStore.CharSheetStore.AmmoUnequip(dat_["Item"],dat_['ind'])
	VarStore.InventoryStore.removeItem(dat_['ind'],1)
	pass # Replace with function body.
