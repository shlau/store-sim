extends KinematicBody2D

var speed = 300
var moveDir = Vector2(0,0)
var spriteDir = "down"

# player can move -- done
# interact with objects


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	controls_loop()
	movements() # check for movements
	spriteDir_loop()
	interactions() # check for interactions
	
	if moveDir != Vector2(0,0):
		anim_switch("walk")
	else:
		anim_switch("idle")
	
func controls_loop():
	var left = Input.is_action_pressed("ui_left")
	var right = Input.is_action_pressed("ui_right")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	moveDir.x = -int(left) + int(right)
	moveDir.y = -int(up) + int(down)

func movements():
	var motion = moveDir.normalized() * speed
	move_and_slide(motion, Vector2(0,0))

func spriteDir_loop():
	match moveDir:
		Vector2(-1,0):
			spriteDir = "left"
		Vector2(1,0):
			spriteDir = "right"
		Vector2(0,-1):
			spriteDir = "up"
		Vector2(0,1):
			spriteDir = "down"

func interactions():
	if Input.is_action_pressed("ui_accept"):
		print("clicked on enter/space")
		
func anim_switch(animation):
	var newanim = str(animation, "_", spriteDir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)