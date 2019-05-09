extends Polygon2D

#maximum amount of characters to display
const maxChar = 700

const testText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."

#number of characters displayed
var numVisible = 0

var dialog = [""]
var page_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process_input(true)
	show_dialog(testText)

# splits the text into strings of length <= maxChar and returns the resulting array
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

func clear_dialog():
	visible = false
	numVisible = 0
	$DialogText.visible_characters = 0
	$Timer.stop()
	$Underscore/Timer.stop()
	
# display the given text in the dialog box
func show_dialog(text):
	visible = true
	dialog = split_text(text)
	$DialogText.set_bbcode(dialog[page_count])
	$Timer.start()
	$Underscore/Timer.start()
	
# increase the number of visible characters every 0.02 seconds
func _on_Timer_timeout():
	$DialogText.visible_characters = numVisible
	if(numVisible < dialog[page_count].length()):
		numVisible += 1


func _input(event):
	# if the enter key is pressed
	if event is InputEventKey and event.pressed and event.scancode == KEY_ENTER:
		# present the next dialog page if the current page is finished
		if $DialogText.visible_characters >= $DialogText.get_total_character_count():			
			if page_count < dialog.size() - 1:
				page_count += 1
				$DialogText.bbcode_text = dialog[page_count]		
			# all pages have been shown, get rid of the dialog box
			else:	
				page_count = 0
				$DialogText.bbcode_text = ""
				visible = false
				$Timer.stop()
				$Underscore/Timer.stop()
			
			numVisible = 0
			
		# current page isn't finished, display the remaining characters
		else:
			numVisible = $DialogText.get_total_character_count()
			
		$DialogText.visible_characters = numVisible