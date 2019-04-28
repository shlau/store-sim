# NPC
# Base class for customers and employees
# Can walk to different areas

extends "res://Characters/Character.gd"

var path # list of points visiting
var destination # current point moving towards
var last_location # last location

func _ready():
	animation = $Sprite/AnimationPlayer
	direction = values.DOWN
	path = Array()
	last_location = position

func init(node_name, spawn):
	body = get_node('../' + node_name)
	position = spawn

func _process(delta):
#	print(path)
	pass

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
			walkTo(destination, delta)
	else:
		faceDirection(body, direction)
	last_location = position

func walkTo(destination, delta):
	var distanceX = destination.x - position.x
	var distanceY = destination.y - position.y
	
	var margin = 10 # within this far from destination
	if abs(distanceX) > margin:
		if destination.x - position.x > margin:
			velocity.x += 1 # move right
		elif destination.x - position.x < margin:
			velocity.x -= 1 # move left
	elif abs(distanceY) > margin:
		if destination.y - position.y > margin:
			velocity.y += 1 # move down
		elif destination.y - position.y < margin:
			velocity.y -= 1 # move up
	move(body, delta) # move
	
func add_destinations(locations):
	for i in locations:
		path.append(i)

func clear_path():
	path.clear()

func within_area(area, margin):
	return abs(position.x-area.x) < margin and abs(position.y-area.y) < margin
