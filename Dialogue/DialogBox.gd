extends Polygon2D

const maxChar = 700
const testText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
var numVisible = 0
var dialog = [""]
var page_count = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	show_dialog(testText)

func split_text(text):
	var temp_dialog = []
	var temp_str = ""
	var numChar = 0
	for i in range(text.length()):
		var c = text[i]
		temp_str += c
		numChar += 1
		if(numChar == maxChar or i == text.length() - 1):
			temp_dialog.append(temp_str)
			temp_str = ""
			numChar = 0
	return temp_dialog

func show_dialog(text):
	dialog = split_text(text)
	$DialogText.set_bbcode(dialog[page_count])
	$Timer.start()
	
func _on_Timer_timeout():
	$DialogText.visible_characters = numVisible
	if(numVisible < dialog[page_count].length()):
		numVisible += 1


func _input(event):
	if event is InputEventKey and event.pressed and event.scancode == KEY_ENTER:
		if $DialogText.visible_characters >= $DialogText.get_total_character_count():
			if page_count < dialog.size() - 1:
				page_count += 1
				$DialogText.bbcode_text = dialog[page_count]
			else:	
				page_count = 0
				$DialogText.bbcode_text = ""
				visible = false
				$Timer.stop()
				$Underscore/Timer.stop()
			numVisible = 0
		else:
			numVisible = $DialogText.get_total_character_count()
		$DialogText.visible_characters = numVisible