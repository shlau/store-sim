# Player
# Moves with arrow keys
# Can interact with objects

extends "res://Characters/Character.gd"

func _ready():
	body = get_node('../Player')
	animation = $Sprite/AnimationPlayer
	direction = values.DOWN

func _physics_process(delta):
	inputs() # get key inputs
	var collision = move_and_collide(velocity * delta)
	if collision:
#		velocity = velocity.slide(collision.normal)
		interact(collision.get_collider())
	move(body, delta) # move

func inputs():
	# Input movements
	velocity = Vector2()
	var right = Input.is_action_pressed("ui_right")
	var left = Input.is_action_pressed("ui_left")
	var up = Input.is_action_pressed("ui_up")
	var down = Input.is_action_pressed("ui_down")
	
	velocity.x = int(right) - int(left)
	velocity.y = int(down) - int(up)

func interact(collider):
	if Input.is_action_just_pressed("ui_accept"):
		if collider.get_name() == "entrance" and direction == values.UP:
			print("Player wants to interact with ", collider.get_name())