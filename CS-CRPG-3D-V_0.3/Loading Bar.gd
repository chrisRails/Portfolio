extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var phase = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func set_end(end):
	$ProgressBar.value =0
	$ProgressBar.max_value = end
	phase += 1
	$Panel/HBoxContainer/Label2.text = str(phase)

func stepDone():
	$ProgressBar.value += 1


