extends Node2D

var employee_pos = Vector2(300,50)
var dialog = preload("res://Dialogue/DialogBox.tscn").instance()
var threshold
var price
var customerPrice
var attempts = 0
var maxAttempts = 3
var employee_text
var negStart
var negCont
var negSuccess
var negFail
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	price = randi()%1000
	customerPrice = randi()%price
	threshold = rand_range(customerPrice,price)
	employee_text = ["I’m glad to be on the team!","I’m ready to work.","Thanks… for hiring me.","Thanks for hiring me. I do my best!","Thanks for believing in me. I won’t let you down."]
	negStart = ["Hi, I’d like to purchase (item), but it’s a little expensive. Could you sell it to me for $%s?"%(customerPrice),
"My son/daughter would really like a new (item). Think you can go a little cheaper?"]
	negCont = ["Hmm… Seems to be a little expensive still.",
"This seems to still be a little bit expensive, how about $%s?"%(customerPrice),
"I’m just a student! Can you go a little lower?"]
	negSuccess = ["Sure that’ll do!","Ok, that’s fine with me.","Fine, that works."]
	negFail = ["No, this is too expensive. Good-bye","Sorry, but I can’t afford that. Bye.","No, thanks."]
	$Label.set_text("price: $" + str(price))
	add_child(dialog)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_button_up():
	var employee = load("res://Characters/Employee.tscn").instance()
	add_child(employee)
	employee.position = employee_pos
	employee_pos.x += 50
	var rand = randi()%employee_text.size()
	dialog.clear_dialog()
	dialog.show_dialog(employee_text[rand])
	pass # Replace with function body.

func show_negotiation():
	$Button2.visible = true
	$Sprite.visible = true
	$LineEdit.visible = true
	$Button3.visible = false
	attempts = 0

func hide_negotiation():
	$Button2.visible = false
	$Sprite.visible = false
	$LineEdit.visible = false
	$Button3.visible = true
	attempts = 0
	
func _on_Button3_button_up():
	show_negotiation()
	dialog.clear_dialog()
	var rand = randi()%negStart.size()
	dialog.show_dialog(negStart[rand])
	pass # Replace with function body.


func _on_Button2_button_up():
	var newPrice = $LineEdit.get_text()
	attempts += 1
	if(newPrice.is_valid_integer()):
		dialog.clear_dialog()	
		if(int(newPrice) <= price and int(newPrice) <= threshold):
			var rand = randi()%negSuccess.size()
			dialog.show_dialog(negSuccess[rand])
			hide_negotiation()
		else:
			if(attempts == maxAttempts):
				var rand = randi()%negFail.size()
				dialog.show_dialog(negFail[rand])
				hide_negotiation()
			else:
				var rand = randi()%negCont.size()
				dialog.show_dialog(negCont[rand])
	else:
		pass # Replace with function body.
