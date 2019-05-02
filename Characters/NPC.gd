# NPC
# Base class for customers and employees
# Can walk to different areas

extends "res://Characters/Character.gd"

var visit
var destination

func _ready():
	body = get_node('../NPC')
	animation = $Sprite/AnimationPlayer
	direction = values.DOWN
	visit = Array()
	
	addDestination(Vector2(100,100))
	addDestination(Vector2(200,400))
	addDestination(Vector2(500,300))
	addDestination(Vector2(200,100))
	
	destination = visit.front()

func _physics_process(delta):
	velocity = Vector2()
	if visit.size()>0:
#		print("destination: ", destination)
		# if destination is pretty much there
		var margin = 10
		if abs(destination.x - position.x) <= margin and abs(destination.y - position.y) <= margin:
			visit.pop_front()
			destination = visit.front() if visit.size() > 0 else null
		else:
#			var collision = move_and_collide(velocity * delta)
#			if collision:
#				print(collision)
#				velocity = velocity.slide(collision.normal)
#			print("trying to walk to ", destination)
			walkTo(destination, delta)
	else:
#		print("facing ", direction)
		faceDirection(body, direction)

func walkTo(destination, delta):
#	print("destination: ", destination)
#	print("position: ", position)
	
	var distanceX = destination.x - position.x
	var distanceY = destination.y - position.y
	
	if abs(distanceX) > 10:
		if destination.x - position.x > 0:
			velocity.x += 1 # move right
		elif destination.x - position.x < 0:
			velocity.x -= 1 # move left
	elif abs(distanceY) > 10:
		if destination.y - position.y > 0:
			velocity.y += 1 # move down
		elif destination.y - position.y < 0:
			velocity.y -= 1 # move up
#	print("velocity: ", velocity)
#	move(body, delta) # move

func addDestination(location):
	visit.append(location)
