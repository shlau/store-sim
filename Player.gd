extends "res://Character.gd"

var screen_size
var speed = 300
# player can move -- done
# interact with objects

func _ready():
	screen_size = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movements(delta) # check for movements
	interactions() # check for interactions
	
func movements(delta):
	# Input movements
	var velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$SampleSprite/AnimatedSprite.play()
	else:
		$SampleSprite/AnimatedSprite.stop()
		
	# Making sure player doesn't leave the screen
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
	# Set walking animation
	if velocity.x > 0:
		$SampleSprite/AnimatedSprite.animation = "right"
	elif velocity.x < 0:
		$SampleSprite/AnimatedSprite.animation = "left"
	elif velocity.y > 0:
		$SampleSprite/AnimatedSprite.animation = "down"
	elif velocity.y < 0:
		$SampleSprite/AnimatedSprite.animation = "up"

func interactions():
	if Input.is_action_pressed("ui_accept"):
		print("clicked on enter/space")