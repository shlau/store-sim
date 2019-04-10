# Player
# Moves with arrow keys
# Can interact with objects

extends "res://Characters/Character.gd"

var screen_size
var speed = 300 # movement speed
var speed_scale = 2 # frames/sec
var direction = 0 # down: 0, left: 1, right: 2, up: 3
var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size
	$Sprite/AnimationPlayer.set_speed_scale(speed_scale)

func _physics_process(delta):
	inputs(delta) # get key inputs
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.slide(collision.normal)
	movement(delta) # move
	interact()
	
func inputs(delta):
	# Input movements
	velocity = Vector2()
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	velocity.x = int(right) - int(left)
	velocity.y = int(down) - int(up)

func movement(delta):
	# Adding velocity
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		# Set walking animation and direction
		if velocity.x > 0:
			$Sprite/AnimationPlayer.set_current_animation("Walk_right")
			direction = 2
		elif velocity.x < 0:
			$Sprite/AnimationPlayer.set_current_animation("Walk_left")
			direction = 1
		elif velocity.y > 0:
			$Sprite/AnimationPlayer.set_current_animation("Walk_down")
			direction = 0
		elif velocity.y < 0:
			$Sprite/AnimationPlayer.set_current_animation("Walk_up")
			direction = 3
	else:
		# Set idle direction
		if direction==0:
			$Sprite/AnimationPlayer.set_current_animation("Idle_down")
		elif direction==1:
			$Sprite/AnimationPlayer.set_current_animation("Idle_left")
		elif direction==2:
			$Sprite/AnimationPlayer.set_current_animation("Idle_right")
		elif direction==3:
			$Sprite/AnimationPlayer.set_current_animation("Idle_up")
	
	# Making sure player doesn't leave the screen
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
func interact():
	if Input.is_action_just_pressed("ui_accept"):
		print("Player pressed enter/space")