# Character 
# Base class for NPC, Player
# Contains sprite, animationPlayer, and collision

extends KinematicBody2D

var walk = preload("res://Characters/WalkMechanics.gd").new()
var values = preload("res://Values.gd").new()

# base character class
func _ready():
	pass