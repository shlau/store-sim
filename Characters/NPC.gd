# NPC
# Base class for customers and employees
# Can walk to different areas

extends "res://Characters/Character.gd"

var npc 
var animation
var screen_size

var direction = values.DOWN
var visit = Array()
var destination

var speed = 300 # movement speed
var speed_scale = 2 # frames/sec
var velocity = Vector2()

func _ready():
	npc = get_node('../NPC')
	animation = $Sprite/AnimationPlayer
	animation.set_speed_scale(speed_scale)

	screen_size = get_viewport_rect().size

	addDestination(Vector2(400,400))
	addDestination(Vector2(200,100))
	destination = visit.front()

func _physics_process(delta):
#	print(position)
	velocity = Vector2()
	if visit.size()>0:
		# if destination is pretty much there
		var margin = 10
		if abs(destination.x - position.x) <= margin and abs(destination.y - position.y) <= margin:
			visit.pop_front()
			destination = visit.front()
			print("Destination is: ", destination)
		else:
			var collision = move_and_collide(velocity * delta)
			if collision:
				velocity = velocity.slide(collision.normal)
				walk.faceDirection(npc, direction)
			else:
				walkTo(destination, delta)
	else:
		walk.faceDirection(npc, direction)

func walkTo(destination, delta):
	if destination.x - position.x > 0:
		velocity.x += 1 # move right
	elif destination.x - position.x < 0:
		velocity.x -= 1 # move left
	elif destination.y - position.y > 0:
		velocity.y += 1 # move down
	elif destination.y - position.y < 0:
		velocity.y -= 1 # move up
	walk.move(npc, delta) # move

func addDestination(location):
	visit.append(location)
