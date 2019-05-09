extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Booking' #change
	price_array = [ 293.99,  327.42,  353.7 ,  386.2 ,  486.28,  519.37,  505.75,
        668.03,  696.52,  622.03,  741.21,  807.01,  682.86,  571.96,
        669.74,  924.26, 1032.71, 1102.81, 1240.89, 1245.99, 1319.32,
       1349.06, 1480.39, 1672.22, 1570.89, 1540.69, 1672.09, 1664.53,
       1397.82, 1520.85, 1512.95, 1512.11, 1645.78, 2013.57, 2268.96,
       2100.46, 2010.62, 1983.34, 1789.21, 2000.82, 1860.53, 1976.65,
       1924.72, 2235.53, 2164.28, 2163.81, 2158.53, 2496.15, 2629.19,
       2887.88, 2978.76, 3239.62, 3290.5 , 3665.69, 3572.89, 3877.05,
       4005.56, 3770.1 , 3603.84, 3753.24, 3827.35, 3934.31, 3627.35,
       3517.35, 3608.04, 3595.84, 3155.84, 3862.71, 3608.97, 3928.93,
       3664.08, 3473.68, 4096.96, 3970.6 , 4084.33, 4116.21, 3997.38,
       3487.49, 3842.59, 4180.52, 4198.5 , 3885.29, 4229.91, 4110.39,
       4385.66, 4500.64, 4569.09, 4742.97, 4603.3 , 4899.21, 5380.95,
       5479.1 , 5921.16, 5885.3 , 5999.66, 5752.32, 5811.47, 5967.93,
       5355.89, 5476.46, 5992.07, 5892.27, 6573.92, 6429.27, 6494.55,
       6345.58, 6484.44, 6006.13, 6170.24, 5709.96, 5883.75, 5341.58,
       5930.55, 5317.79, 5579.28]
	if (Global.day > 115):
		var gamma = 3.11
		supply_price = round(gamma * 231.67881661750192 * exp(0.0221879 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
	$"info/prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	$"info/prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
	$"info/prod info/name/HBoxContainer/prod_name".set_text(product_name)

func _on_Button_pressed():
	var bought_stock = int($"info/input price/buy_stock".get_text())
	_buy_units(bought_stock)