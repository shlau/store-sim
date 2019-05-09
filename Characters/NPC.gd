# NPC
# Base class for customers and employees
# Can walk to different areas

extends "res://Characters/Character.gd"

var path # list of points visiting
var destination # current point moving towards
#<<<<<<< HEAD
var last_location # last location

#=======
var prev = position
var idle_anim = "Idle_down"
#>>>>>>> 86d1bc65077375a417056d8ea0850521e7e04d4d
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
#<<<<<<< HEAD
	velocity = Vector2()
	if path.size()>0:
		destination = path.front()
		# if destination is pretty much there
		var margin = 10
		if abs(destination.x - position.x) <= margin and abs(destination.y - position.y) <= margin:
			path.pop_front()
			destination = path.front() if path.size() > 0 else null
		else:
#			var collision = move_and_collide(velocity * delta)
			walkTo(destination, delta)
	else:
		faceDirection(body, direction)
	last_location = position
#=======
#	if path.size() > 0:
#		var d = position.distance_to(path[0])
#		if d > 3:	
#			var v = (path[0] - position).normalized()
#			v *= delta*speed
#			set_anim(v)
#			prev = position
#			var collision = move_and_collide(v)
#		else:	
#			path.remove(0)
#>>>>>>> 86d1bc65077375a417056d8ea0850521e7e04d4d

			
func set_anim(v):
	if(abs(position.x - prev.x) < 0.2 and abs(position.y - prev.y) < 0.2):
		animation.set_current_animation(idle_anim)
	else:
		print("prev is: ", prev, " . . . curr is: ",position)
		if(abs(v.x) > abs(v.y)):
			if(v.x > 0):
				animation.set_current_animation("Walk_right")
				idle_anim = "Idle_right"
			else:
				animation.set_current_animation("Walk_left")
				idle_anim = "Idle_left"
		else:
			if(v.y > 0):
				animation.set_current_animation("Walk_down")
				idle_anim = "Idle_down"
			else:
				animation.set_current_animation("Walk_up")
				idle_anim = "Idle_up"
	
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
#		print("adding %d", i)
		path.append(i)

func clear_path():
	path.clear()

func within_area(area, margin):
	return abs(position.x-area.x) < margin and abs(position.y-area.y) < margin
