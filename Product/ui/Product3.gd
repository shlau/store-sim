extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Costco' #change
	price_array = [ 445.57,  451.68,  429.29,  451.12,  478.87,  521.52,  525.86,
        563.05,  547.88,  541.86,  553.52,  558.24,  535.39,  532.06,
        523.09,  512.17,  566.47,  584.69,  619.93,  668.87,  673.12,
        673.77,  661.0 ,  750.18,  754.15,  740.28,  718.82,  726.5 ,
        755.08,  780.98,  806.6 ,  750.45,  779.59,  827.23,  806.42,
        779.78,  830.93,  888.56,  892.44,  943.41,  891.05,  894.84,
        919.82,  948.03,  936.93,  996.04, 1005.38, 1023.6 , 1033.78,
       1105.38, 1057.74, 1037.94, 1135.71, 1110.37, 1061.62, 1071.24,
       1053.11, 1049.88, 1064.95, 1067.08, 1087.71, 1121.93, 1180.49,
       1206.57, 1284.55, 1325.9 , 1322.66, 1361.32, 1410.62, 1339.12,
       1276.96, 1289.91, 1352.81, 1295.09, 1421.08, 1446.61, 1497.02,
       1391.11, 1375.01, 1423.94, 1400.64, 1313.59, 1452.53, 1550.02,
       1524.96, 1391.66, 1395.46, 1401.19, 1481.02, 1555.39, 1544.75,
       1572.69, 1597.29, 1668.52, 1403.69, 1449.01, 1507.66, 1478.61,
       1585.82, 1782.75, 1778.68, 1718.19, 1672.77, 1794.22, 1834.83,
       1942.78, 2026.77, 2129.26, 2170.51, 2114.83, 2146.74, 1914.75,
       1933.71, 2154.88, 2265.42]
	if (Global.day > 115):
		var gamma = 9.25
		supply_price = round(gamma * 54.85850092670591 * exp(0.01284829 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
                supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
        	#Setting text for products
	$"prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	$"prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
	$"prod info/name/HBoxContainer/prod_name".set_text(product_name)

func _on_Button_pressed():
        var bought_stock = int($"input price/LineEdit".get_text())
         _buy_units(bought_stock)
        