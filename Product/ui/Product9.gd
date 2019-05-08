extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Facebook' #change
	price_array = [ 975.58,  941.26,  646.2 ,  594.72,  659.37,  625.06,  646.81,
        745.16,  865.27,  901.43,  943.41,  872.01,  829.73,  829.42,
        800.93,  800.62,  713.61,  762.32,  798.17, 1171.06, 1282.9 ,
       1484.51, 1516.68, 1535.37, 1406.07, 1702.66, 1775.28, 1883.75,
       2140.2 , 2119.98, 1782.94, 1831.66, 1853.41, 1969.85, 2031.13,
       2303.82, 2256.02, 2386.55, 2420.56, 2357.75, 2298.0 , 2312.09,
       2469.89, 2268.89, 2281.76, 2443.54, 2586.94, 2559.05, 2376.44,
       2468.05, 2506.05, 2631.36, 2917.23, 2774.76, 2820.41, 2821.02,
       3131.1 , 3185.03, 3235.89, 3286.45, 2885.06, 3122.52, 3321.07,
       3483.46, 3384.19, 3653.51, 3640.34, 3504.6 , 3578.14, 3753.71,
       3783.43, 3932.64, 3944.59, 3973.7 , 3609.09, 3667.0 , 3580.59,
       4028.55, 4088.6 , 4235.67, 4363.44, 4402.36, 4606.11, 4707.22,
       4706.0 , 4990.03, 5246.49, 5149.05, 5275.29, 5292.75, 5596.7 ,
       5541.86, 5465.87, 5768.9 , 5733.36, 5451.16, 5643.58, 4882.18,
       5336.26, 5630.41, 5794.02, 5953.96, 6462.28, 5516.73, 5244.34,
       5052.84, 4865.02, 4594.16, 4190.33, 4087.38, 4454.75, 5244.34,
       4988.5 , 5069.08, 5441.05]
	if (Global.day > 115):
		var gamma = 30.64
		supply_price = round(gamma * 29.128563700057995 * exp(0.01886102 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
		
	$"prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	$"prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
	$"prod info/name/HBoxContainer/prod_name".set_text(product_name)


func _on_Button_pressed():
        var bought_stock = int($"input price/LineEdit".get_text())
        _buy_units(bought_stock)
