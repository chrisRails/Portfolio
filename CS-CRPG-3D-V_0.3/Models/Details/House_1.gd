extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var roll1 = randi() % 10
	var roll2 = randi() % 10
	var roll3 = randi() % 10
	if roll3 > 6:
		roll1 = roll2
		
	if roll1 > 7:
		$Planter/Tree.show()
		$Planter/Tree/Tree/Mesh/StaticBody/CollisionShape.disabled = false
		$Planter/Tree/Tree/Mesh/StaticBody/CollisionShape2.disabled = false
	elif roll1 > 5:
		$Planter/Flowers.show()
	
		
		
		
	if roll2 > 7:
		$Planter2/Tree.show()
		$Planter2/Tree/Tree/Mesh/StaticBody/CollisionShape.disabled = false
		$Planter2/Tree/Tree/Mesh/StaticBody/CollisionShape2.disabled = false
	elif roll2 > 5:
		$Planter2/Flowers.show()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
