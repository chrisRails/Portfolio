extends Spatial



var tiles = []


func _ready():
	tiles = [
]
	pass # Replace with function body.

func place():
	$Tile1.place()
	$Tile2.place()
	$Tile3.place()
	$Tile4.place()
	$Tile5.place()
	$Tile6.place()
	$Tile7.place()
	$Tile8.place()
	pass


func gen(tile, sub, terr, rnum):
	$Tile1.gen(tile[0], sub, terr, [rnum, 1])
	$Tile2.gen(tile[1], sub, terr, [rnum, 2])
	$Tile3.gen(tile[2], sub, terr, [rnum, 3])
	$Tile4.gen(tile[3], sub, terr, [rnum, 4])
	$Tile5.gen(tile[4], sub, terr, [rnum, 5])
	$Tile6.gen(tile[5], sub, terr, [rnum, 6])
	$Tile7.gen(tile[6], sub, terr, [rnum, 7])
	$Tile8.gen(tile[7], sub, terr, [rnum, 8])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
