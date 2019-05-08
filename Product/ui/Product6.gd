extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'NVR' #change
	price_array = [ 815.0 ,  803.33,  830.89,  992.87, 1126.25, 1051.89, 1110.8 ,
       1107.81, 1161.65, 1092.1 , 1213.5 , 1161.65, 1131.11, 1102.53,
       1089.35, 1004.54, 1035.9 , 1020.93, 1007.31, 1101.88, 1283.98,
       1192.82, 1238.8 , 1171.16, 1204.72, 1175.23, 1108.55, 1037.9 ,
        984.49, 1025.3 , 1094.12, 1165.45, 1178.49, 1175.98, 1210.6 ,
       1323.97, 1252.04, 1414.84, 1343.53, 1408.32, 1427.86, 1452.66,
       1537.12, 1686.07, 1669.23, 1744.67, 1655.41, 1602.86, 1528.89,
       1506.12, 1362.26, 1496.45, 1535.05, 1596.03, 1646.66, 1881.82,
       1913.16, 1848.34, 1790.49, 1845.16, 1875.84, 1917.66, 1874.6 ,
       1974.71, 2019.15, 2021.2 , 2067.35, 2153.67, 2205.6 , 2153.23,
       2228.19, 2243.61, 2400.34, 2527.32, 2559.1 , 2673.18, 2705.8 ,
       2469.45, 2578.09, 2819.9 , 2847.61, 2762.8 , 2776.1 , 2806.06,
       2751.42, 2683.42, 2516.72, 2599.85, 2738.4 , 3026.81, 3232.27,
       3406.88, 3524.57, 3904.78, 4098.96, 4345.47, 4563.36, 4772.82,
       5379.0 , 5551.03, 5884.67, 5207.25, 4908.29, 5002.62, 4849.33,
       4846.15, 4575.52, 4352.18, 4027.4 , 3654.53, 3993.5 , 3932.91,
       4132.39, 4464.46, 4691.24]
	if (Global.day > 115):
		var gamma = 1.63
		supply_price = round(gamma * 495.11103220217115 * exp(0.01559115 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
       $"prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
       $"prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
       $"prod info/name/HBoxContainer/prod_name".set_text(product_name)
       
func _on_Button_pressed():
       var bought_stock = int($"input price/LineEdit".get_text())
       _buy_units(bought_stock)
       