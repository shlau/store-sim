extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Disney' #change
	price_array = [ 435.59,  544.54,  522.57,  585.15,  599.35,  619.99,  624.43,
        681.9 ,  711.63,  658.38,  739.15,  803.72,  793.51,  759.79,
        759.79,  747.36,  759.12,  773.99,  819.25,  822.14,  869.18,
        946.4 ,  951.06,  939.3 ,  909.57,  841.44,  856.98,  745.14,
        669.25,  745.58,  812.38,  876.5 ,  909.35,  937.31,  918.0 ,
       1010.98, 1025.84, 1062.01, 1107.06, 1157.21, 1160.32, 1074.88,
       1109.5 , 1206.69, 1208.91, 1257.95, 1402.63, 1415.72, 1411.51,
       1464.98, 1360.25, 1433.25, 1531.11, 1577.93, 1672.9 , 1728.82,
       1806.04, 1751.9 , 1798.5 , 1858.86, 1913.0 , 2005.53, 1959.6 ,
       1952.5 , 2009.97, 2108.72, 2068.55, 2359.91, 2352.14, 2458.87,
       2447.56, 2556.07, 2426.48, 2261.38, 2342.38, 2605.55, 2397.41,
       2199.25, 2119.14, 2201.25, 2291.56, 2214.12, 2192.15, 2161.08,
       2126.25, 2040.59, 2074.54, 2196.14, 2320.19, 2469.75, 2455.77,
       2507.47, 2472.41, 2314.86, 2304.21, 2248.96, 2172.18, 2150.88,
       2324.18, 2453.55, 2450.22, 2351.7 , 2232.31, 2207.02, 2265.82,
       2313.53, 2499.04, 2498.15, 2594.9 , 2546.52, 2562.72, 2432.25,
       2472.19, 2546.3 , 2593.12]
	if (Global.day > 115):
		var gamma = 22.19
		supply_price = round(gamma * 28.94576884176992 * exp(0.01438318 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
        $"prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
        $"prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
        $"prod info/name/HBoxContainer/prod_name".set_text(product_name)

func _on_Button_pressed():
        var bought_stock = int($"input price/LineEdit".get_text())
         _buy_units(bought_stock)
        
