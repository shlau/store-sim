extends MarginContainer

#sounds effects for selecting and confirming menu options
var select_player
var enter_player

# Called when the node enters the scene tree for the first time.
func _ready():
	#Centers window
	var screen_size = OS.get_screen_size()
	var window_size = OS.get_window_size()
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	
#	load sound effect resources
	select_player = AudioStreamPlayer.new()
	enter_player = AudioStreamPlayer.new()
	self.add_child(select_player)
	self.add_child(enter_player)
	select_player.stream = load("res://MainMenu/ui_main_menu_design/Music/selectsound.wav")
	enter_player.stream = load("res://MainMenu/ui_main_menu_design/Music/entersound.wav")
	
	set_process_input(true)
	
	# set the default menu option selected to be the new game button
	$HBoxContainer/TextContainer/VBoxContainer/MenuOptions/NewGameButton.grab_focus()
	
	#	assign a listener to each menu option
	for button in $HBoxContainer/TextContainer/VBoxContainer/MenuOptions.get_children():
		button.connect("pressed",self,"_on_Button_pressed", [button.scene_path])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_released("ui_down") or Input.is_action_just_released("ui_up")):
		select_player.play()
	elif(Input.is_action_just_pressed("ui_enter")):
		enter_player.play()

#load the appropriate scene with respect to the button pressed
func _on_Button_pressed(scene_path):
	get_tree().change_scene(scene_path)