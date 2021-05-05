extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func LoadAbilities():
	var AB = getDat("Abilities")
	var ABD = {}
	var r = 0
	for item in AB['sheets'][0]['lines']:
		ABD[AB['sheets'][0]['lines'][r]['ID']] = item
		r += 1
	VarStore.abilities =  ABD
	var cards = getDat("Cards")
	var classes = cards['sheets'][0]['lines']
	var CD = {}
	r = 0
	for item in classes:
		CD[classes[r]['ID']] = item
		r += 1
	VarStore.classes = CD
	var races = cards['sheets'][1]['lines']
	var RD = {}
	r = 0
	for item in races:
		RD[races[r]['ID']] = item
		r += 1
	VarStore.races = RD
	var per = cards['sheets'][2]['lines']
	var PD = {}
	r = 0
	for item in per:
		PD[per[r]['ID']] = item
		r += 1
	VarStore.personalities = PD


func getDat(loc):
	var fi = File.new()
	fi.open("Database/" + str(loc), File.READ)
	var content = fi.get_as_text()
	fi.close()
	#print(content)
	return parse_json(content)

func saveDat(loc, dat):
	var fi = File.new()
	fi.open("Database/" + str(loc), File.WRITE)
	fi.store_string(str(JSON.print(dat)))
	fi.close()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
