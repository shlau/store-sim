extends VBoxContainer
var _timer = null

func _ready():
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(0.1)
	_timer.set_one_shot(false) # Make sure it loops
	_timer.start()
	
	$HBoxContainer/day/Label.set_text("Day %s" % Global.day)
	$HBoxContainer/money/Label.set_text("$%s" % str(Global.money)) 

func _on_Timer_timeout():
	$HBoxContainer/day/Label.set_text("Day %s" % Global.day)
	$HBoxContainer/money/Label.set_text("$%s" % str(Global.money)) 