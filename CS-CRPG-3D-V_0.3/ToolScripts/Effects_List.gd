extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var effects = []
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func New_Effect(effect):
	effects.append(effect)
	$EffectList.add_item(effect["name"] + " - " + effect["element type"] + " - " + effect["effect type"])
	pass

func load_effects():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func get_effect():
	if focus >= 0:
		return [effects[focus], focus]

var focus = -1
func _on_EffectList_item_selected(index):
	focus = index




func _on_Delete_pressed():
	if focus >= 0:
		$EffectList.remove_item(focus)
		effects.remove(focus)
	pass # Replace with function body.


func _on_EffectList_nothing_selected():
	focus = -1
