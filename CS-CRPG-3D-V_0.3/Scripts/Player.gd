extends KinematicBody




#const GRAVITY = -24.8
var GRAVITY = 0
var vel = Vector3()
var MAX_SPEED = 10
var JUMP_SPEED = int(MAX_SPEED* .80)
const ACCEL = 2.5

var dir = Vector3()

const DEACCEL= 16
const MAX_SLOPE_ANGLE = 40

var camera
var rotation_helper

var MOUSE_SENSITIVITY = 0.15

var obj

var vec3 = Vector3()

func _process(_delta):
	vec3 = self.get_global_transform().origin
	VarStore.player_rot = self.rotation_degrees.y


var ftl_cooldown = 0


func _ready():
	camera = $Rotation_Helper/Camera
	rotation_helper = $Rotation_Helper
	VarStore.PlayerStore = self
	VarStore.CharSheetStore.recalSpeed()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	process_input(delta)
	process_movement(delta)

func process_input(_delta):
	
	if Input.is_action_just_pressed("ui_HUD_Switch"):
		if UIUP:
			UIUP = false
		else:
			UIUP = true
	
	if UIUP == false:
		# ----------------------------------
		# Walking
		dir = Vector3()
		var cam_xform = camera.get_global_transform()

		var input_movement_vector = Vector2()
		


		if Input.is_action_pressed("movement_forward"):
			input_movement_vector.y += 1
		if Input.is_action_pressed("movement_backward"):
			input_movement_vector.y -= 1
		if Input.is_action_pressed("movement_left"):
			input_movement_vector.x -= 1
		if Input.is_action_pressed("movement_right"):
			input_movement_vector.x += 1

		input_movement_vector = input_movement_vector.normalized()

		# Basis vectors are already normalized.
		dir += -cam_xform.basis.z * input_movement_vector.y
		dir += cam_xform.basis.x * input_movement_vector.x
		# ----------------------------------

		
		# ----------------------------------
		# Jumping
		if true : #is_on_floor():
			if Input.is_action_just_pressed("movement_jump"):
				vel.y = JUMP_SPEED
		# ----------------------------------

		# ----------------------------------
		# Capturing/Freeing the cursor
		if Input.is_action_just_pressed("ui_cancel"):
			if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
				Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
				#GRAVITY = -24.8
			else:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				#GRAVITY = 0
				
		# ----------------------------------
		#Fast Travel Boundery Finder
		if ftl_cooldown == 0:
			if $Rotation_Helper/Camera/Select.is_colliding():
				obj = $Rotation_Helper/Camera/Select.get_collider()
				if obj.fast_travel:
					ftl_cooldown = 200
					obj.action()
		else:
			ftl_cooldown -= 1
			
		# ----------------------------------
		if Input.is_action_pressed("Query"):
			q_tock = true
			if $Rotation_Helper/Camera/Select.is_colliding() and q_tick ==0:
				obj = $Rotation_Helper/Camera/Select.get_collider()
				obj.event()
				
			q_tick+=1
			if q_tick == 8:
				q_tick = 0
		if !q_tock:
			q_tick = 0
		q_tock = false
		# ----------------------------------
		if Input.is_mouse_button_pressed(1):
			$Rotation_Helper/Camera/AnimationPlayer.play("Wep_Swing")
func attack():
	if $Rotation_Helper/Camera/Select.is_colliding():
		obj = $Rotation_Helper/Camera/Select.get_collider()
		obj.attack()
var q_tick = 0
var q_tock = false
var UIUP = false

func get_loc_tile():
	var tile = $Rotation_Helper/Camera/TileTester.get_collider()
	pass

func interact():
	if $Rotation_Helper/Camera/Select.is_colliding():
			obj = $Rotation_Helper/Camera/Select.get_collider()
			return obj.event()
			

func process_movement(delta):
	dir.y = 0
	dir = dir.normalized()

	vel.y += delta * GRAVITY

	var hvel = vel
	hvel.y = 0

	var target = dir
	if Input.is_action_pressed("Run"):
		target *= MAX_SPEED * 2
	else:
		target *= MAX_SPEED

	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL

	hvel = hvel.linear_interpolate(target, accel * delta)
	vel.x = hvel.x
	vel.z = hvel.z
	vel = move_and_slide(vel, Vector3(0, 1, 0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))

func _input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY * -1))
		self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))

		var camera_rot = rotation_helper.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -70, 70)
		rotation_helper.rotation_degrees = camera_rot
	
	if event is InputEventMouseButton:
		pass

func Mouse_Toggle():
	if Input.get_mouse_mode() == Input.MOUSE_MODE_VISIBLE:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		#GRAVITY = -24.8
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if UIUP:
		UIUP = false
	else:
		UIUP = true
	pass

func Move_Player(vec3 : Vector3):
	self.set_translation(vec3)
	pass
