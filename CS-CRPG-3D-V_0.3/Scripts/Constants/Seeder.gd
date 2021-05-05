extends LineEdit


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = str(VarStore.world_seed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var ranint = (randi() % 999999999)
	self.text = str(ranint)



		
		
		
func texcon(tex):
	var tot = 0
	var pos = 1
	for letter in tex:
		if letter == 'a':
			tot += 1 * pos
		elif letter == 'b':
			tot += 2 * pos
		elif letter == 'c':
			tot += 3 * pos
		elif letter == 'd':
			tot += 4 * pos
		elif letter == 'e':
			tot += 5 * pos
		elif letter == 'f':
			tot += 6 * pos
		elif letter == 'g':
			tot += 7 * pos
		elif letter == 'h':
			tot += 8 * pos
		elif letter == 'i':
			tot += 9 * pos
		elif letter == 'j':
			tot += 10 * pos
		elif letter == 'k':
			tot += 11 * pos
		elif letter == 'l':
			tot += 12 * pos
		elif letter == 'm':
			tot += 13 * pos
		elif letter == 'n':
			tot += 14 * pos
		elif letter == 'o':
			tot += 15 * pos
		elif letter == 'p':
			tot += 16 * pos
		elif letter == 'q':
			tot += 17 * pos
		elif letter == 'r':
			tot += 18 * pos
		elif letter == 's':
			tot += 19 * pos
		elif letter == 't':
			tot += 20 * pos
		elif letter == 'u':
			tot += 21 * pos
		elif letter == 'v':
			tot += 22 * pos
		elif letter == 'w':
			tot += 23 * pos
		elif letter == 'x':
			tot += 24 * pos
		elif letter == 'y':
			tot += 25 * pos
		elif letter == 'z':
			tot += 26 * pos
		elif letter == 'A':
			tot += 27 * pos
		elif letter == 'B':
			tot += 28 * pos
		elif letter == 'C':
			tot += 29 * pos
		elif letter == 'D':
			tot += 30 * pos
		elif letter == 'E':
			tot += 31 * pos
		elif letter == 'F':
			tot += 32 * pos
		elif letter == 'G':
			tot += 33 * pos
		elif letter == 'H':
			tot += 34 * pos
		elif letter == 'I':
			tot += 35 * pos
		elif letter == 'J':
			tot += 36 * pos
		elif letter == 'K':
			tot += 37 * pos
		elif letter == 'L':
			tot += 38 * pos
		elif letter == 'M':
			tot += 39 * pos
		elif letter == 'N':
			tot += 40 * pos
		elif letter == 'O':
			tot += 41 * pos
		elif letter == 'P':
			tot += 42 * pos
		elif letter == 'Q':
			tot += 43 * pos
		elif letter == 'R':
			tot += 44 * pos
		elif letter == 'S':
			tot += 45 * pos
		elif letter == 'T':
			tot += 46 * pos
		elif letter == 'U':
			tot += 47 * pos
		elif letter == 'V':
			tot += 48 * pos
		elif letter == 'W':
			tot += 49 * pos
		elif letter == 'X':
			tot += 50 * pos
		elif letter == 'Y':
			tot += 51 * pos
		elif letter == 'Z':
			tot += 52 * pos
		elif letter in ['0','1','2','3','4','5','6','7','8','9']:
			tot += int(letter) * pos
		pos = pos * 10
	return tot
