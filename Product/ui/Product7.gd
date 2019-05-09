extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Google' #change
	price_array = [ 693.72,  729.21,  749.77,  793.22,  840.49,  899.03,  993.75,
       1063.75, 1130.26,  949.98, 1010.24, 1021.09,  917.99,  880.93,
        886.07,  877.08,  866.76, 1084.64, 1052.65, 1065.43, 1130.3 ,
       1100.42, 1058.36,  960.87,  934.38,  890.22, 1088.67,  975.07,
        928.81, 1043.51, 1118.73, 1188.45, 1094.24, 1082.46, 1146.86,
       1091.46, 1011.85, 1036.8 , 1203.8 , 1280.34, 1362.42, 1208.2 ,
       1290.55, 1359.13, 1442.28, 1444.85, 1479.55, 1564.66, 1598.57,
       1632.06, 1586.19, 1561.23, 1844.4 , 1944.29, 2038.11, 2140.04,
       2149.78, 2013.12, 1923.62, 2017.01, 2154.74, 2114.94, 2110.51,
       1976.53, 1954.5 , 1933.23, 1832.23, 2066.32, 1932.48, 1938.69,
       1961.82, 1933.87, 2371.87, 2296.97, 2396.33, 2706.99, 2679.0 ,
       2611.06, 2613.13, 2696.81, 2766.46, 2576.5 , 2536.38, 2704.35,
       2833.15, 2865.46, 2934.9 , 2805.27, 2866.28, 2910.41, 3024.75,
       3030.61, 3422.52, 3585.28, 3404.1 , 3297.22, 3379.54, 3590.17,
       3717.08, 3775.17, 4055.41, 3939.82, 3759.75, 3650.82, 3875.06,
       4043.45, 4472.82, 4447.72, 4309.28, 3746.75, 3961.45, 3848.71,
       4008.72, 4209.96, 4288.53]
	if (Global.day > 115):
		var gamma = 3.57
		supply_price = round(gamma * 206.55694913279925 * exp(0.01582592 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
              supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
	$"info/prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	$"info/prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
	$"info/prod info/name/HBoxContainer/prod_name".set_text(product_name)

func _on_Button_pressed():
	var bought_stock = int($"info/input price/buy_stock".get_text())
	_buy_units(bought_stock)
