extends ParallaxLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var loop_speed = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	set_mirroring(Vector2(1920,0))
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = position.x - loop_speed * delta
	
#	reset the background once the end is reached
	if(position.x <= -1920):
		position.x = 0
	pass
