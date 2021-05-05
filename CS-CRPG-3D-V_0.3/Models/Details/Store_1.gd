extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var roll1 = randi() % 10
	var roll2 = randi() % 10
	var roll3 = randi() % 10
	var roll4 = randi() % 10
	if roll1 <= 4:
		$Store_1/Spot1_A.show()
	elif roll1 <= 8:
		$Store_1/Spot1_B.show()
	if roll2 <= 4:
		$Store_1/Spot2_A.show()
	elif roll2 <= 8:
		$Store_1/Spot2_B.show()
	if roll3 <= 4:
		$Store_1/Spot3_A.show()
	elif roll3 <= 8:
		$Store_1/Spot3_B.show()
	if roll4 <= 4:
		$Store_1/Spot4_A.show()
	elif roll4 <= 8:
		$Store_1/Spot4_B.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
