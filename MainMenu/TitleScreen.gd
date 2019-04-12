extends MarginContainer
var select_player
var enter_player
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	select_player = AudioStreamPlayer.new()
	enter_player = AudioStreamPlayer.new()
	self.add_child(select_player)
	self.add_child(enter_player)
	select_player.stream = load("res://MainMenu/ui_main_menu_design/selectsound.wav")
	enter_player.stream = load("res://MainMenu/ui_main_menu_design/entersound.wav")
	set_process_input(true)
	$HBoxContainer/TextContainer/VBoxContainer/MenuOptions/NewGameButton.grab_focus()
	for button in $HBoxContainer/TextContainer/VBoxContainer/MenuOptions.get_children():
		button.connect("pressed",self,"_on_Button_pressed", [button.scene_path])

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up")):
		select_player.play()
	elif(Input.is_key_pressed(KEY_ENTER)):
		enter_player.play()
func _on_Button_pressed(scene_path):
	get_tree().change_scene(scene_path)