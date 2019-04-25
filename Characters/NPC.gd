# NPC
# Base class for customers and employees
# Can walk to different areas

extends "res://Characters/Character.gd"

var path # list of points visiting
var destination # current point moving towards

func _ready():
	body = get_node('../NPC')
	animation = $Sprite/AnimationPlayer
	direction = values.DOWN
	path = Array()

func init(spawn):
	position = spawn

func _physics_process(delta):
	velocity = Vector2()
	if path.size()>0:
		destination = path.front()
		# if destination is pretty much there
		var margin = 10
		if abs(destination.x - position.x) <= margin and abs(destination.y - position.y) <= margin:
			path.pop_front()
			destination = path.front() if path.size() > 0 else null
		else:
			var collision = move_and_collide(velocity * delta)
			if collision:
				velocity = velocity.slide(collision.normal)
			walkTo(destination, delta)
	else:
		faceDirection(body, direction)

func walkTo(destination, delta):
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
	move(body, delta) # move
	
func add_destinations(locations):
	for i in locations:
		path.append(i)
		
func within_area(area, margin):
	return abs(position.x-area.x) < margin and abs(position.y-area.y) < margin
