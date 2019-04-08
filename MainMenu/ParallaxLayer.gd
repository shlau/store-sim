extends ParallaxLayer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_mirroring(Vector2(1920,0))
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x = position.x - 100*delta
	if(position.x <= -1920):
		position.x = 0
	pass
