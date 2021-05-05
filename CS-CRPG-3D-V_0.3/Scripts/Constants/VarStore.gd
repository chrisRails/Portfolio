extends Node

var GridStore
var WorldStore
var PlayerStore
var InventoryStore
var HUDStore
var CharSheetStore
var InfoBookStore
var HotbarStore
var AbilityBarStore
var StatBookStore
var MenuStore

var tileStore = {}
var detailStore = {}

var world_seed = 5456346
var seed_const = world_seed

var loading 

var player_pos = Vector3()

var exit1 = false
var inWorld = {}
var printout = ''
var player_rot = 0 #need to set
var view_radius = 17
var locations = {
	"1": ''
}
var Player_Location_ID = 0
var world #to be class map
var mapnum = 0

var Ent_Dic = {}

var player_cards = {
	'class' : '',
	'race' : '',
	'personality' : ''
}

var abilities
var classes
var races
var personalities


var skill_XP = {
	"athletics":0,
	"acrobatics":0,
	"archana":0,
	"apraisal":0,
	"crafting":0,
	"farming":0,
	"fishing":0,
	"forraging":0,
	"perception":0,
	"stab":0,
	"shoot":0,
	"slash":0,
	"stealth":0,
	"speach":0,
	"theif":0
}
var skill_lv = {
	"athletics":0,
	"acrobatics":0,
	"archana":0,
	"apraisal":0,
	"crafting":0,
	"farming":0,
	"fishing":0,
	"forraging":0,
	"perception":0,
	"stab":0,
	"shoot":0,
	"slash":0,
	"stealth":0,
	"speach":0,
	"theif":0
}


var icons = ['']
func _ready():
	biomeLoader()
	var j
	for i in range(1,1024):
		if i < 10:
			j = ("00" + str(i))
		elif i < 100:
			j = ("0" + str(i))
		else:
			j = str(i)
		icons.append(load("Graphics/Individual_16x16/icon" + j + ".png"))

var Items = {}


func quit():
	get_tree().quit()


var ItemObj = load("res://Models/item.tscn")


var biomes = {}
var biomelist = []
func biomeLoader():
	var files = []
	var biome = ""
	var dir = Directory.new()
	dir.open("res://Biomes/")
	dir.list_dir_begin()
	while true:
		var file = dir.get_next()
		if file == "":
			break
		elif not file.begins_with("."):
			if file.ends_with(".tres"):
				files.append(file)
	for b in files:
		biome = load("Biomes/" + b)
		biomes[biome.name] = biome
		biomelist.append(biome.name)
		print(biome.name + " Loaded")
	pass


func prinTime(tag = ""):
	var time = OS.get_time()
	print(tag + " : " + str(time["hour"]) + " : " + str(time["minute"]) + " : " + str(time["second"]))

