extends Node

# Declare member variables here. Examples:
var product_name
var price_array
var supply_price
var market_price
var initial_sell
var final_sell
var units

var stock_text = "Current stock: %s"
var supply_text = "Supply price: %s"

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_sell = 0
	final_sell = 0
	units = 0
	supply_price = 0
	
	var beta;
	var alpha;
	if (Global.upgrade == 0):
		alpha = 1/6
		beta = 1.2
	elif (Global.upgrade == 1):
		alpha = 1/3
		beta = 1.24
	elif (Global.upgrade == 2):
		alpha = 1/2
		beta = 1.275
	elif (Global.upgrade == 3):
		alpha = 2/3
		beta = 1.305
	elif (Global.upgrade == 4):
		alpha = 5/6
		beta = 1.33
	else:
		alpha = 1
		beta = 1.4
	market_price = round(supply_price * (min(beta, 5 + (alpha * 0.005) * Global.day) + rand_range(-0.15, 0.15))) #add event variation

func _set_initial(val):
	initial_sell = val
	
func _set_final(val):
	final_sell = val
	
func _buy_units(num):
	var cost = num * supply_price
	Global.money = Global.money - cost
	if num > 0:
		units = units + num
		$"prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	
func _sell_units(): #run at the end of every work phase; lose money for leftover units
	Global.money -= round(units * supply_price * 1.05)
	units = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
