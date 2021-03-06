extends "res://Product/ui/Product.gd"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Seaboard' #change 
	price_array = [ 291.06,  276.48,  288.63,  299.43,  320.49,  359.1 ,  378.0  ,
        401.76,  376.38,  330.75,  379.08,  380.69,  394.13,  418.77,
        420.66,  424.98,  470.88,  481.95,  521.1 ,  528.12,  552.15,
        621.0 ,  621.0 ,  641.25,  633.15,  650.16,  706.05,  627.48,
        486.54,  557.55,  530.27,  534.6 ,  557.36,  515.16,  501.01,
        524.18,  531.74,  595.08,  608.04,  616.43,  623.43,  579.03,
        688.5 ,  691.78,  755.99,  747.9 ,  708.29,  713.88,  737.1 ,
        795.15,  731.16,  735.75,  737.4 ,  743.58,  717.13,  678.78,
        716.85,  676.4 ,  710.26,  782.46,  782.12,  783.0 ,  669.64,
        791.1 ,  958.5 , 1089.45, 1050.3 , 1085.4 , 1126.43,  958.5 ,
        929.34,  977.4 ,  896.4 ,  843.75,  858.33,  870.21,  823.77,
        696.87,  796.5 ,  769.5 ,  823.5 ,  775.98,  759.36,  783.27,
        871.83,  886.95,  940.95, 1066.5 , 1082.03, 1054.62, 1061.24,
       1063.85, 1082.7 , 1122.66, 1038.42, 1143.91, 1216.35, 1256.6 ,
       1158.54, 1128.6 , 1162.89, 1112.4 , 1102.95, 1082.7 , 1087.56,
       1099.46, 1004.67,  996.3 , 1001.71, 1039.23, 1004.94,  980.63,
        985.78, 1050.3 , 1171.1 ]
	if (Global.day > 115):
		var gamma = 0.27
		supply_price = round(gamma * 1463.539968769813 * exp(0.01037498 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
		#Setting text for products
	$"info/prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	$"info/prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
	$"info/prod info/name/HBoxContainer/prod_name".set_text(product_name)

func _on_Button_pressed():
        var bought_stock = int($"info/input price/buy_stock".get_text())
        _buy_units(bought_stock)
        
