extends GridContainer

# default grid item used to create other items
var baseItem

# makes the grid visible
func show_grid():
	visible = true

# makes the grid invisible
func hide_grid():
	visible = false

# move the top left corner of the grid to the given coordinates
func set_grid_pos(posX,posY):
	rect_position.x = posX
	rect_position.y = posY

# adds an item label to the end of the grid list
func add_grid_item(label):
	var dup = baseItem.duplicate()
	dup.get_child(0).get_child(0).text = label
	add_child(dup)

# creates a grid with the strings in the given array
func create_grid(arr,posX,posY):
	baseItem.visible = true
	for item in arr:
		add_grid_item(str(item))
	baseItem.visible = false
	set_grid_pos(posX,posY)

# removes all the grid items
func destroy_grid():
	baseItem.visible = false
	for child in get_children():
		child.free()

# Called when the node enters the scene tree for the first time.		
func _ready():
	baseItem = get_parent().get_node("MarginContainer")
	baseItem.visible = false
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
