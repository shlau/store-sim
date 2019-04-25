extends Node2D

var inpc

func _ready():
	inpc =  preload("res://Characters/NPC.tscn").instance()
	inpc.init(Vector2(100,100))
	add_child(inpc)
	inpc.add_destinations([Vector2(500,500)])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
