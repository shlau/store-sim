# NPC
# Base class for customers and employees
# Can walk to different areas

extends "res://Characters/Character.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
#	pass

func walkTo(location):
	print(location)
	pass
