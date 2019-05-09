extends VBoxContainer

func _ready():
	$"daily info/HBoxContainer/day/Label".set_text("Day %s" % Global.day)
	$"daily info/HBoxContainer/money/Label".set_text("$%s" % str(Global.money)) 
