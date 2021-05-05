extends Control


# Basics
var n = 'Bob'
var c = ''
var r = ''
var p = ''
var cards

# Stats
var body
var mind
var senses
var XP
var next_XP
var HP
var HP_Max
var MP
var MP_Max
var AC
var Level
var speed
var speed_max
var carry_cap
# Combat Stats
var Attack_Bonus
var Dam_Min
var Dam_Max
var Wep_Reach
var Wep_Mat
var Wep_Speed
# Equipment
var Head
var Neck
var Cape
var R_hand
var L_hand
var Body
var Legs
var R_ring
var L_ring
var Belt
var Boots
var Back
var Head_Index
var Neck_Index
var Cape_Index
var R_hand_Index
var L_hand_Index
var Body_Index
var Legs_Index
var R_ring_Index
var L_ring_Index
var Belt_Index
var Boots_Index
var Back_Index

var ringToggle = true

# Called when the node enters the scene tree for the first time.
func _ready():
	VarStore.CharSheetStore = self
	# Nametag
	if true:
		cards = VarStore.player_cards
		#collect name
		$TextureRect/Nametag/Name.text = n
		c = VarStore.classes[cards['class']]['Name']
		$TextureRect/Nametag/Class.text = c
		r = VarStore.races[cards['race']]['Name']
		$TextureRect/Nametag/Race.text = r
		p = VarStore.personalities[cards['personality']]['Name']
		$TextureRect/Nametag/Personality.text = p
	# Stats
	if true:
		body = VarStore.classes[cards['class']]['stat_body']
		body += VarStore.races[cards['race']]['stat_body']
		body += VarStore.personalities[cards['personality']]['stat_body']
		$TextureRect/Stats2/Body.text = str(body)
		mind = VarStore.classes[cards['class']]['stat_mind']
		mind += VarStore.races[cards['race']]['stat_mind']
		mind += VarStore.personalities[cards['personality']]['stat_mind']
		$TextureRect/Stats2/Mind.text = str(mind)
		senses = VarStore.classes[cards['class']]['stat_senses']
		senses += VarStore.races[cards['race']]['stat_senses']
		senses += VarStore.personalities[cards['personality']]['stat_senses']
		$TextureRect/Stats2/Senses.text = str(senses)
		
		Level = 1
		
		HP_Max = (((body + 5) * 2) * Level) + ((mind + 5) * Level)
		HP = HP_Max
		$TextureRect/Stats/HP.text = str(HP)
		$TextureRect/Stats/HP_Max.text = str(HP_Max)
		
		MP_Max = (((mind + 5) * 3) * Level)
		MP = MP_Max
		$TextureRect/Stats/MP.text = str(MP)
		$TextureRect/Stats/MP_Max.text = str(MP_Max)
		
		AC = 2 + senses
		$TextureRect/Stats/AC.text = str(AC)
		
		speed = int((senses + body) / 2)
		speed_max = speed
		
		XP = 0
		next_XP = 100
		$TextureRect/XP/ProgressBar.max_value = next_XP
		$TextureRect/XP/ProgressBar.value = XP
		$TextureRect/XP/LevelNum.text = str(Level)
		
		carry_cap = (10 * body) + (Level * 5)
		VarStore.InventoryStore.setCarryCap(carry_cap)
		
	pass # Replace with function body.


func ABSelect(ab):
	$TextureRect/NinePatchRect/desc.ABChange(ab)


func recal():
	recalAC()
	recalCarry()
	recalHP()
	recalMP()
	recalSpeed()

func recalHP():
	HP_Max = (((body + 5) * 2) * Level) + ((mind + 5) * Level)
	HP = HP_Max
	$TextureRect/Stats/HP.text = str(HP)
	$TextureRect/Stats/HP_Max.text = str(HP_Max)

func recalMP():
	MP_Max = (((mind + 5) * 3) * Level)
	MP = MP_Max
	$TextureRect/Stats/MP.text = str(MP)
	$TextureRect/Stats/MP_Max.text = str(MP_Max)

func recalAC():
	AC = 2 + senses
	if Head:
		AC += Head.ACBonus
	if Body:
		AC += Body.ACBonus
	if Legs:
		AC += Legs.ACBonus
	if Boots :
		AC += Boots.ACBonus
	if L_hand:
		if L_hand.type == "Armor":
			AC += L_hand.ACBonus
	$TextureRect/Stats/AC.text = str(AC)

func recalSpeed():
	speed = int((senses + body) / 2)
	speed_max = speed
	VarStore.PlayerStore.MAX_SPEED = int(speed)

func recalXP(up = 0):
	XP + up
	if XP >= next_XP:
		Level += 1
		$TextureRect/XP/ProgressBar.min_value = next_XP
		next_XP += 100
		recal()
		$TextureRect/XP/ProgressBar.max_value = next_XP
		$TextureRect/XP/LevelNum.text = str(Level)
	$TextureRect/XP/ProgressBar.value = XP

func recalCarry():
	carry_cap = (10 * body) + (Level * 5)
	VarStore.InventoryStore.setCarryCap(carry_cap)


func unequip(item, Index):
	VarStore.InventoryStore.equipToggle(item, Index)
	pass

var empty = load("res://Graphics/individual_16x16/icon000.png")

func ArmorEquip(item, index):
	
	if item.subType == "Head":
		if Head:
			unequip(Head, Head_Index)
		Head = item
		Head_Index = index
		VarStore.InventoryStore.equipToggle(item, index)
		$TextureRect/Equipment/GridContainer/Head.Set_Item(item, index)
	elif item.subType == "Body":
		if Body:
			unequip(Body, Body_Index)
		Body = item
		Body_Index = index
		VarStore.InventoryStore.equipToggle(item, index)
		$TextureRect/Equipment/GridContainer/Body.Set_Item(item, index)
	elif item.subType == "Legs":
		if Legs:
			unequip(Legs, Legs_Index)
		Legs = item
		Legs_Index = index
		VarStore.InventoryStore.equipToggle(item, index)
		$TextureRect/Equipment/GridContainer/Legs.Set_Item(item, index)
	elif item.subType == "Boots":
		if Boots:
			unequip(Boots, Boots_Index)
		Boots = item
		Boots_Index = index
		VarStore.InventoryStore.equipToggle(item, index)
		$TextureRect/Equipment/GridContainer/Boots.Set_Item(item, index)
	elif item.subType == "Cape":
		if Cape:
			unequip(Cape, Cape_Index)
		Cape = item
		Cape_Index = index
		VarStore.InventoryStore.equipToggle(item, index)
		$TextureRect/Equipment/GridContainer/Cape.Set_Item(item, index)
	elif item.subType == "Belt":
		if Belt:
			unequip(Belt, Belt_Index)
		Belt = item
		Belt_Index = index
		VarStore.InventoryStore.equipToggle(item, index)
		$TextureRect/Equipment/GridContainer/Belt.Set_Item(item, index)
	elif item.subType == "Shield":
		if L_hand:
			unequip(L_hand, L_hand_Index)
		L_hand = item
		L_hand_Index = index
		VarStore.InventoryStore.equipToggle(item, index)
		$TextureRect/Equipment/GridContainer/Left_Hand.Set_Item(item, index)
	recalAC()

func ArmorUnequip(item, index):
	if item.subType == "Head":
		unequip(Head, Head_Index)
		Head = null
		Head_Index = null
		$TextureRect/Equipment/GridContainer/Head.Remove_Item()
	elif item.subType == "Body":
		unequip(Body, Body_Index)
		Body = null
		Body_Index = null
		$TextureRect/Equipment/GridContainer/Body.Remove_Item()
	elif item.subType == "Legs":
		unequip(Legs, Legs_Index)
		Legs = null
		Legs_Index = null
		$TextureRect/Equipment/GridContainer/Legs.Remove_Item()
	elif item.subType == "Boots":
		unequip(Boots, Boots_Index)
		Boots = null
		Boots_Index = null
		$TextureRect/Equipment/GridContainer/Boots.Remove_Item()
	elif item.subType == "Cape":
		unequip(Cape, Cape_Index)
		Cape = null
		Cape_Index = null
		$TextureRect/Equipment/GridContainer/Cape.Remove_Item()
	elif item.subType == "Belt":
		unequip(Belt, Belt_Index)
		Belt = null
		Belt_Index = null
		$TextureRect/Equipment/GridContainer/Belt.Remove_Item()
	elif item.subType == "Shield":
		unequip(L_hand, L_hand_Index)
		L_hand = null
		L_hand_Index = null
		$TextureRect/Equipment/GridContainer/L_hand.Remove_Item()
	recalAC()


func WeaponEquip(item, index):
	if R_hand:
		unequip(item,index)
	R_hand = item
	R_hand_Index = index
	$TextureRect/Equipment/GridContainer/Right_Hand.Set_Item(item, index)
	pass

func WeaponUnequip(item, index):
	unequip(item,index)
	R_hand = null
	R_hand_Index = null
	$TextureRect/Equipment/GridContainer/Right_Hand.Remove_Item()
	pass


func ItemEquip(item, index):
	if item["subType"] == "Ring":
		if R_ring:
			if L_ring:
				if ringToggle:
					unequip(R_ring,R_ring_Index)
					R_ring = item
					R_ring_Index = index
					$TextureRect/Equipment/GridContainer/Right_Ring.Set_Item(item, index)
					ringToggle = false
				else:
					unequip(L_ring,L_ring_Index)
					L_ring = item
					L_ring_Index = index
					$TextureRect/Equipment/GridContainer/Left_Ring.Set_Item(item, index)
					ringToggle = true
			else:
				L_ring = item
				L_ring_Index = index
				$TextureRect/Equipment/GridContainer/Left_Ring.Set_Item(item, index)
		else:
			R_ring = item
			R_ring_Index = index
			$TextureRect/Equipment/GridContainer/Right_Ring.Set_Item(item, index)
	elif item["subType"] == "Neck":
		if Neck:
			unequip(Neck,Neck_Index)
		Neck = item
		Neck_Index = index
		$TextureRect/Equipment/GridContainer/Right_Hand.Set_Item(item, index)
		
	pass

func ItemUnequip(item, index):
	if item["subType"] == "Ring":
		if R_ring.ID == item.ID:
			unequip(item,index)
			R_ring = null
			R_ring_Index = null
			$TextureRect/Equipment/GridContainer/Right_Ring.Remove_Item()
		elif L_ring == item.ID:
			unequip(item,index)
			L_ring = null
			L_ring_Index = null
			$TextureRect/Equipment/GridContainer/Left_Ring.Remove_Item()
	elif item["subType"] == "Neck":
		unequip(item,index)
		Neck = null
		Neck_Index = null
		$TextureRect/Equipment/GridContainer/Right_Hand.Remove_Item()


func AmmoEquip(item, index):
	if Back:
		unequip(Back,Neck_Index)
	Back = item
	Back_Index = index
	$TextureRect/Equipment/GridContainer/Back.Set_Item(item, index)

func AmmoUnequip(item, index):
	unequip(Back,Neck_Index)
	Back = null
	Back_Index = null
	$TextureRect/Equipment/GridContainer/Back.Remove_Item()

