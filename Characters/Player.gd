extends "res://Characters/Character.gd"

var screen_size
var speed = 300
var speed_scale = 2
var direction = 0 # down: 0, left: 1, right: 2, up: 3

# player can move -- done
# interact with objects

var player_name = "" # get from start of game

func _ready():
	screen_size = get_viewport_rect().size
	$Sprite/AnimationPlayer.set_speed_scale(speed_scale)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movements(delta) # check for movements
	interactions() # check for interactions
	
func movements(delta):
	# Input movements
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		direction = 2
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		direction = 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		direction = 3
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		direction = 0
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
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
	
	# Set walking animation
	if velocity.x > 0:
		$Sprite/AnimationPlayer.set_current_animation("Walk_right")
	elif velocity.x < 0:
		$Sprite/AnimationPlayer.set_current_animation("Walk_left")
	elif velocity.y > 0:
		$Sprite/AnimationPlayer.set_current_animation("Walk_down")
	elif velocity.y < 0:
		$Sprite/AnimationPlayer.set_current_animation("Walk_up")

func interactions():
	if Input.is_action_pressed("ui_accept"):
		print("clicked on enter/space")
