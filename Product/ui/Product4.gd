extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Microsoft' #change
	price_array = [ 640.82,  688.92,  805.77,  794.93,  836.25,  872.15,  955.81,
       1016.44, 1048.28,  942.94,  975.46, 1027.62,  978.17,  869.1 ,
        861.65,  826.43,  850.81,  865.04,  874.18,  944.97,  960.21,
        900.6 ,  874.18,  887.06,  835.57,  873.85,  928.04,  888.41,
        843.02,  880.28,  854.2 ,  937.52, 1027.95, 1083.5 , 1027.95,
       1055.39,  986.63,  997.13, 1022.87, 1057.08, 1002.21,  904.67,
        929.73,  944.3 ,  941.92,  969.02, 1108.23, 1205.43, 1151.92,
       1073.68, 1058.1 , 1127.87, 1293.16, 1311.11, 1220.67, 1269.11,
       1288.75, 1368.35, 1346.33, 1405.94, 1518.39, 1531.6 , 1576.99,
       1524.83, 1611.87, 1621.7 , 1422.88, 1465.89, 1364.62, 1612.21,
       1562.76, 1498.41, 1583.08, 1458.78, 1595.62, 1812.38, 1831.01,
       1798.84, 1775.47, 1811.71, 1882.83, 1714.5 , 1727.03, 1921.45,
       1962.77, 1927.2 , 2053.54, 2052.86, 2130.42, 2153.45, 2176.82,
       2220.52, 2335.0 , 2436.95, 2370.56, 2418.66, 2529.41, 2612.05,
       2842.71, 2868.45, 3051.69, 3140.43, 3041.19, 3153.97, 3329.76,
       3355.84, 3647.12, 3734.51, 3873.71, 3513.34, 3755.84, 3452.37,
       3591.24, 3821.55, 4040.01]
	if (Global.day > 115):
		var gamma = 33.87
		supply_price = round(gamma * 19.390651537922455 * exp(0.0138596 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
	$"info/prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	$"info/prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
	$"info/prod info/name/HBoxContainer/prod_name".set_text(product_name)
       
func _on_Button_pressed():
	var bought_stock = int($"info/input price/buy_stock".get_text())
	_buy_units(bought_stock)
       