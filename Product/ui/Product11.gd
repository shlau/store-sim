extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Amazon' #change
	price_array = [  869.78,   845.83,   886.94,   916.93,   909.7 ,   989.66,
        1322.64,  1494.42,  1444.78,  1250.99,  1389.97,  1511.25,
        1407.66,  1327.49,  1330.41,  1345.41,  1569.41,  1776.47,
        1702.45,  1916.09,  1963.35,  1946.73,  1846.17,  1967.02,
        2104.05,  2183.36,  2400.99,  2275.83,  2333.12,  2288.67,
        2115.16,  1916.41,  1987.41,  1988.81,  2028.2 ,  2456.67,
        2316.94,  2330.75,  2561.76,  2783.82,  2670.42,  2522.49,
        2772.17,  3064.25,  2840.47,  2822.77,  2678.4 ,  2879.64,
        3064.68,  3247.68,  3173.34,  3345.22,  3843.18,  4152.96,
        4290.75,  3768.41,  4046.68,  3492.51,  3202.04,  3528.33,
        3893.46,  3592.1 ,  3491.97,  3379.21,  3621.56,  3335.08,
        3364.11,  4149.94,  4016.58,  4544.64,  4606.79,  4636.46,
        5639.07,  5577.24,  5824.44,  7117.95,  6907.22,  6398.47,
        5762.94,  5956.94,  6829.96,  7583.21,  7667.37,  7980.39,
        8170.73,  8622.94,  8875.75,  8273.45,  8255.97,  8981.06,
        9134.92,  9811.13, 10240.14, 10900.81, 10726.66, 10325.17,
       10602.04, 10800.03, 12183.74, 12670.27, 13954.92, 15843.5 ,
       16669.69, 15754.37, 17297.13, 18246.86, 19608.34, 20855.13,
       21612.37, 16513.23, 18236.93, 16998.46, 17698.41, 18025.99,
       19843.03]
	if (Global.day > 115):
		var gamma = 10.79
		supply_price = round(gamma * 87.99298561339471 * exp(0.02566193 * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
	
	#Setting text for products
	$"info/prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
	$"info/prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
	$"info/prod info/name/HBoxContainer/prod_name".set_text(product_name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	var bought_stock = int($"info/input price/buy_stock".get_text())
	_buy_units(bought_stock)


#func _on_buy_stock_text_entered(new_text):
#	if (!new_text.is_valid_integer()):
