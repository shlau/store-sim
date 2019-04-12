extends MarginContainer

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/TextContainer/VBoxContainer/MenuOptions/NewGameButton.grab_focus()
	for button in $HBoxContainer/TextContainer/VBoxContainer/MenuOptions.get_children():
		button.connect("pressed",self,"_on_Button_pressed", [button.scene_path])
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Button_pressed(scene_path):
	get_tree().change_scene(scene_path)