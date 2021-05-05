extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var eff = false
var efe = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Effect.hide()
	$Effects.hide()


func _on_Effects_pressed():
	if eff == false:
		$Effects.show()
		eff = true
	else:
		if efe == true:
			$Effect.hide()
			$Effects.hide()
			efe = false
			eff = false
		else:
			$Effects.hide()
			eff = false


func Clear():
	ClearItem()
	ClearEffect()


func ClearEffect():
	$Effect/Element.selected = 0
	$Effect/Effect.selected = 0
	$Effect/Range_Type.selected = 0
	$Effect/Range_Amount.text = "0"
	$Effect/Num.text = "0"
	$Effect/Per.text = "0"
	$Effect/Chance_Effect.text = "0"
	$Effect/Name.text = ''
	$Effect/Desc.text = ''


func _on_New_Effect_pressed():
	ClearEffect()
	$Effect.show()


func _on_ECancel_pressed():
	ClearEffect()
	$Effect.hide()


func _on_Type_item_selected(index):
	if index == 0:
		$Weapon.show()
		$Armor.hide()
		$Consumable.hide()
		$E_Item.hide()
		$Quest.hide()
		$Other.hide()
		$Currancy.hide()
	elif index == 1:
		$Weapon.hide()
		$Armor.show()
		$Consumable.hide()
		$E_Item.hide()
		$Quest.hide()
		$Other.hide()
		$Currancy.hide()
	elif index == 2:
		$Weapon.hide()
		$Armor.hide()
		$Consumable.show()
		$E_Item.hide()
		$Quest.hide()
		$Other.hide()
		$Currancy.hide()
	elif index == 3:
		$Weapon.hide()
		$Armor.hide()
		$Consumable.hide()
		$E_Item.show()
		$Quest.hide()
		$Other.hide()
		$Currancy.hide()
	elif index == 4:
		$Weapon.hide()
		$Armor.hide()
		$Consumable.hide()
		$E_Item.hide()
		$Quest.show()
		$Other.hide()
		$Currancy.hide()
	elif index == 6:
		$Weapon.hide()
		$Armor.hide()
		$Consumable.hide()
		$E_Item.hide()
		$Quest.hide()
		$Other.show()
		$Currancy.hide()
	elif index == 5:
		$Weapon.hide()
		$Armor.hide()
		$Consumable.hide()
		$E_Item.hide()
		$Quest.hide()
		$Other.hide()
		$Currancy.show()


func _on_Save_pressed(): #for effect
	var e = $Effect.get_effect()
	$Effects.New_Effect(e)
	ClearEffect()
	$Effect.hide()


func ClearItem():
	$Tags/IconNum.text = "001"
	$Tags/Icon.texture = VarStore.icons[1]
	$Tags/Known.toggle_mode = false
	$Tags/Value.text = "0"
	$Tags/Desc.text = ''
	$Base/Type.selected = 0
	$Base/Name.text = ""
	$Base/Weight.text = "0"
	
	$Weapon/Weapon_Type.selected = 0
	$Weapon/Material.selected = 0
	$Weapon/Attack_Bonus.text = "0"
	$Weapon/Damage_N.text = "0"
	$Weapon/Damage_D.text = "0"
	$Weapon/Damage_B.text = "0"
	$Weapon/Range.text = "0"
	$Weapon/Attack_Speed.text = "0"
	$Weapon/Crit_Range.text = "20"
	$Weapon/Crit_Mul.text = "1"
	
	$Armor/Armor_Type.selected = 0
	$Armor/Material.selected = 0
	$Armor/AC_Bonus.text = "0"
	$Armor/Damage_Res.text = "0"

	$Consumable/Consumable_Type.selected = 0
	$Consumable/Expiration_Time.text = "0"
	$Consumable/Durration.text = "0"

	$E_Item/E_Item_Type.selected = 0
	$E_Item/Material.selected = 0

	$Quest/Quest_ID.text = ""
	$Quest/Hidden.toggle_mode = false

	$Currancy/Source.text = ""

	$Other/Other_Type.selected = 0
	$Other/Material.selected = 0


func loadItem(item):
	ClearItem()
	$Tags/IconNum.text = str(item["tags"]['icon'])
	$Tags/Icon.texture = VarStore.icons[item["tags"]["icon"]]
	$Tags/Known.toggle_mode = item["tags"]['known']
	$Tags/Value.text = str(item["tags"]['value'])
	$Tags/Desc.text = item["tags"]['description']
	$Base/Type.selected = int(item["typeIndex"])
	$Base/Name.text = item["name"]
	$Base/Weight.text = str(item["weight"])
	$Effects.effects = item["effects"]
	if item["type"] == 'weapon':
		$Weapon/Weapon_Type.selected = int(item["subtypeI"])
		$Weapon/Material.selected = int(item["material_Index"])
		$Weapon/Attack_Bonus.text = str(item["attack_bonus"])
		$Weapon/Damage_N.text = str(item["damage"][0])
		$Weapon/Damage_D.text = str(item["damage"][1])
		$Weapon/Damage_B.text = str(item["damage"][2])
		$Weapon/Range.text = str(item["range"])
		$Weapon/Attack_Speed.text = str(item["attack_speed"])
		$Weapon/Crit_Range.text = str(item["crit_range"])
		$Weapon/Crit_Mul.text = str(item["crit_mul"])
	elif item["type"] == 'armor':
		$Armor/Armor_Type.selected = int(item["subtypeI"])
		$Armor/Material.selected = int(item["material_Index"])
		$Armor/AC_Bonus.text = str(item["AC_bonus"])
		$Armor/Damage_Res.text = str(item["damage_reduction"])
	elif item["type"] == 'consumable':
		$Consumable/Consumable_Type.selected = int(item["subtypeI"])
		$Consumable/Expiration_Time.text = str(item["expiration"])
		$Consumable/Durration.text = str(item["duration"])
	elif item["type"] == 'item':
		$E_Item/E_Item_Type.selected = int(item["subtypeI"])
		$E_Item/Material.selected = int(item["material_Index"])
	elif item["type"] == 'quest':
		$Quest/Quest_ID.text = item["quest_ID"]
		$Quest/Hidden.toggle_mode = item["hidden"]
	elif item["type"] == 'currency':
		$Currancy/Source.text = item["source"]
	elif item["type"] == 'other':
		$Other/Other_Type.selected = int(item["subtypeI"])
		$Other/Material.selected = int(item["material_Index"])


var effectEdit = false
var effectIndex = 0

func _on_Edit_Effect_pressed():
	var e = $Effects.get_effect()
	$Effect.edit_effect(e)
	effectEdit = true
	$Effect.show()


func save():
	var b_tags = {
		'icon': int($Tags/IconNum.text),
		'subtype' : "",
		'known' : $Tags/Known.toggle_mode,
		'value' : int($Tags/Value.text),
		'description' : $Tags/Desc.text
		}
	var data = {
		"count": 0,
		"type": $Base/Type.text,
		"typeIndex" : $Base/Type.selected,
		"name": $Base/Name.text,
		"tags": b_tags,
		"weight": int($Base/Weight.text),
		"effects": $Effects.effects
	}
	if data["type"] == 'weapon':
		data['weapon_type'] = $Weapon/Weapon_Type.text
		data["subtypeI"] = $Weapon/Weapon_Type.selected
		data['material'] = $Weapon/Material.text
		data["material_Index"] = $Weapon/Material.selected
		data['attack_bonus'] = int($Weapon/Attack_Bonus.text)
		data['damage'] = [int($Weapon/Damage_N.text), int($Weapon/Damage_D.text), int($Weapon/Damage_B.text)]
		data['range'] = int($Weapon/Range.text)
		data['attack_speed'] = int($Weapon/Attack_Speed.text)
		data['crit_range'] = int($Weapon/Crit_Range.text)
		data['crit_mul'] = int($Weapon/Crit_Mul.text)
	elif data["type"] == 'armor':
		data['armor_type'] = $Armor/Armor_Type.text
		data["subtypeI"] = $Armor/Armor_Type.selected
		data['material'] = $Armor/Material.text
		data["material_Index"] = $Armor/Material.selected
		data['AC_bonus'] = int($Armor/AC_Bonus.text)
		data['damage_reduction'] = int($Armor/Damage_Res.text)
	elif data["type"] == 'consumable':
		data['consumable_type'] = $Consumable/Consumable_Type.text
		data["subtypeI"] = $Consumable/Consumable_Type.selected
		data['expiration'] = int($Consumable/Expiration_Time.text)
		data['duration'] = int($Consumable/Durration.text)
	elif data["type"] == 'item':
		data['item_type'] = $E_Item/E_Item_Type.text
		data["subtypeI"] = $E_Item/E_Item_Type.selected
		data['material'] = $E_Item/Material.text
		data["material_Index"] = $E_Item/Material.selected
	elif data["type"] == 'quest':
		data['quest_ID'] = $Quest/Quest_ID.text
		data['hidden'] = $Quest/Hidden.toggle_mode
	elif data["type"] == 'currency':
		data['source'] = $Currancy/Source.text
	elif data["type"] == 'other':
		data['other_type'] = $Other/Other_Type.text
		data["subtypeI"] = $Other/Other_Type.selected
		data['material'] = $Other/Material.text
		data["material_Index"] = $Other/Material.selected
	return data


func _on_EffectList_item_activated(_index):
	var e = $Effects.get_effect()
	$Effect.edit_effect(e)
	effectEdit = true
	$Effect.show()
