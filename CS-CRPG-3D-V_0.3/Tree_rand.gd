extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func gen(s):
	seed(s)
	var roll1 = randi() % 10
	var roll2 = randi() % 10
	var roll3 = randi() % 10
	var roll4 = randi() % 10
	
	if roll1 > 5:
		$Tree7.show()
		$Tree7/Mesh/StaticBody/CollisionShape.disabled = false
		$Tree7/Mesh/StaticBody/CollisionShape2.disabled = false
	if roll2 > 5:
		$Tree2.show()
		$Tree2/Mesh/StaticBody/CollisionShape.disabled = false
		$Tree7/Mesh/StaticBody/CollisionShape2.disabled = false
	if roll3 > 5:
		$Tree3.show()
		$Tree3/Mesh/StaticBody/CollisionShape.disabled = false
		$Tree3/Mesh/StaticBody/CollisionShape2.disabled = false
	if roll4 > 5:
		$Tree4.show()
		$Tree4/Mesh/StaticBody/CollisionShape.disabled = false
		$Tree4/Mesh/StaticBody/CollisionShape2.disabled = false
	if (roll1 + roll2) % 10  > 5:
		$Tree5.show()
		$Tree5/Mesh/StaticBody/CollisionShape.disabled = false
		$Tree5/Mesh/StaticBody/CollisionShape2.disabled = false
	if (roll3 + roll4) % 10  > 5:
		$Tree6.show()
		$Tree6/Mesh/StaticBody/CollisionShape.disabled = false
		$Tree6/Mesh/StaticBody/CollisionShape2.disabled = false
	if (roll1 + roll2) % 10  > 5:
		$Tree8.show()
		$Tree8/Mesh/StaticBody/CollisionShape.disabled = false
		$Tree8/Mesh/StaticBody/CollisionShape2.disabled = false
	if (roll1 + roll3) % 10  > 5:
		$Tree9.show()
		$Tree9/Mesh/StaticBody/CollisionShape.disabled = false
		$Tree9/Mesh/StaticBody/CollisionShape2.disabled = false
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
