extends Path2D
onready var follow = $"PathFollow2D"
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	follow.set_offset(follow.get_offset() + 100*delta)
	print(follow.is_rotating())
