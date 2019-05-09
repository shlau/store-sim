extends "res://Product/ui/Product.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'WhiteMountain' #change
	price_array = [ 244.83,  278.56,  284.27,  312.46,  408.72,  402.18,  405.33,
        413.23,  437.47,  425.75,  461.09,  471.6 ,  444.08,  437.23,
        429.38,  402.04,  405.27,  420.84,  417.27,  431.91,  449.21,
        475.7 ,  480.86,  464.93,  533.43,  554.92,  555.44,  524.0 ,
        529.11,  556.16,  564.22,  583.15,  613.21,  651.29,  675.08,
        700.86,  656.7 ,  700.46,  678.42,  698.95,  680.06,  673.58,
        672.61,  716.31,  740.15,  748.02,  740.19,  776.78,  773.19,
        772.06,  731.44,  748.68,  775.55,  778.42,  771.66,  764.5 ,
        764.06,  783.92,  770.37,  784.69,  797.72,  829.92,  822.98,
        834.81,  839.92,  843.18,  844.4 ,  871.8 ,  899.51,  872.85,
        833.24,  888.7 ,  947.79, 1011.28, 1006.15,  986.89, 1000.42,
        961.41,  962.85, 1021.52, 1064.72, 1044.06, 1092.75, 1080.72,
       1079.22, 1086.16, 1093.65, 1119.8 , 1095.23, 1198.32, 1208.28,
       1135.63, 1138.06, 1139.83, 1133.02, 1125.76, 1143.39, 1140.43,
       1156.17, 1128.76, 1102.06, 1061.24, 1051.05, 1135.95, 1188.14,
       1174.09, 1186.94, 1203.25, 1222.4 , 1161.54, 1220.12, 1122.55,
       1183.4 , 1189.66, 1196.55]
	if (Global.day > 115):
		var gamma = 1.31
		supply_price = round(gamma * 298.59873626266887 * exp(0.01139599 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
	#Setting text for products
	$"info/prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	$"info/prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
	$"info/prod info/name/HBoxContainer/prod_name".set_text(product_name)


func _on_Button_pressed():
        var bought_stock = int($"info/input price/buy_stock".get_text())
        _buy_units(bought_stock)
        