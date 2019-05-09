# Character 
# Base class for NPC, Player
# Contains sprite, animationPlayer, and collision

extends KinematicBody2D

var values = preload("res://Values.gd").new()

var body
var screen_size
var animation
var direction
var speed
var speed_scale
var velocity

# base character class
func _ready():
	body = get_parent()	
	animation = $Sprite/AnimationPlayer
	screen_size = get_viewport_rect().size
	direction = values.DOWN
	speed = 300 # movement speed
	speed_scale = 2 # frames/sec
	velocity = Vector2()
	animation.set_speed_scale(speed_scale)

func move(body, delta):
	
	# Adding velocity
	if velocity.length() > 0:
		body.velocity = velocity.normalized() * body.speed

		# Set walking animation and direction
		if velocity.x > 0:
			body.animation.set_current_animation("Walk_right")
			body.direction = 2
		elif body.velocity.x < 0:
			body.animation.set_current_animation("Walk_left")
			body.direction = 1
		elif body.velocity.y > 0:
			body.animation.set_current_animation("Walk_down")
			body.direction = 0
		elif body.velocity.y < 0:
			body.animation.set_current_animation("Walk_up")
			body.direction = 3
	else:
		# Set idle direction
		faceDirection(body, direction)
	
	# Move sprite
	body.position += body.velocity * delta
	
	# Making sure player doesn't leave the screen
	var margin = 20
	body.position.x = clamp(body.position.x, margin, body.screen_size.x-margin)
	body.position.y = clamp(body.position.y, margin, body.screen_size.y-margin)
	
func faceDirection(body, direction):
	match direction:
		0:
			body.animation.set_current_animation("Idle_down")
		1:
			body.animation.set_current_animation("Idle_left")
		2:
			body.animation.set_current_animation("Idle_right")
		3:
			body.animation.set_current_animation("Idle_up")