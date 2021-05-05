extends Sprite3D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var base_frame = self.frame
var base_y  = self.frame_coords.y
export var self_rot = 0
var tick = 0
export (int) var speed = 1
var frame_tick = 0
var moving = true
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		tick += delta
		if tick >= speed:
			tick -= speed
			frameTick()
	rot()
	pass

func frameTick():
	frame_tick = (frame_tick + 1) % 4
	if frame_tick == 0:
		self.frame_coords.x = base_frame
	elif frame_tick ==1:
		self.frame_coords.x = base_frame + 1
	elif frame_tick ==2:
		self.frame_coords.x = base_frame
	elif frame_tick ==3:
		self.frame_coords.x = base_frame-1
	

func rot():
	var row = 0
	var trot = self_rot + VarStore.player_rot
	if trot > 360:
		trot-=360
	elif trot < 0:
		trot += 360
	#print(trot)
	if trot < 45:
		row = 0
	elif trot < 135:
		row = 1
	elif trot < 225:
		row = 3
	elif trot < 315:
		row = 2
	
	
	
	self.frame_coords.y = row + base_y
	
	pass
