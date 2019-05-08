extends "res://Product/ui/Product.gd"

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	product_name = 'Netflix' #change
	price_array = [  697.41,   635.67,   659.68,   697.41,   722.57,   754.58,
         873.48,   963.8 ,   841.47,   993.53,  1163.88,  1358.24,
        1760.68,  2071.66,  1977.91,  2240.87,  2294.6 ,  2499.25,
        2722.2 ,  2908.56,  2973.72,  3449.34,  3756.88,  3854.06,
        4320.53,  4327.39,  4302.24,  3838.06,  1849.86,  1361.67,
        1145.59,  1409.69,  2024.78,  1734.39,  1702.37,  1256.49,
        1023.25,  1335.37,  1050.69,   915.78,  1099.85,  1355.95,
        1473.71,  2647.88,  3072.05,  2885.69,  3503.07,  3680.28,
        3676.85,  4179.9 ,  4761.84,  4937.91,  5338.07,  5930.3 ,
        5501.56,  7129.62,  6864.37,  5646.76,  6070.92,  7189.07,
        6988.99,  7827.03,  7359.42,  6288.15,  5700.49,  5585.02,
        7215.37,  7672.69,  6897.53,  9155.55, 10243.97, 10944.81,
       14066.02, 11373.55, 12970.74, 12903.28, 13796.2 , 11894.89,
       10345.72, 11554.19, 10859.06, 10848.77, 10479.49, 10450.91,
       11126.6 , 11098.01, 14459.32, 13434.92, 14154.05, 15914.74,
       16169.69, 16433.79, 18002.4 , 18067.57, 18149.89, 19596.16,
       20995.56, 22807.69, 22375.52, 21736.42, 25205.19, 32131.3 ,
       34406.47, 34957.54, 40162.99, 44633.29, 38295.98, 42078.01,
       43608.89, 34502.51, 33190.0 , 36052.82, 39410.69, 40732.35,
       41697.29]
	if (Global.day > 115):
		var gamma = 114.33
		supply_price = round(gamma * 6.973302628830162 * exp(0.03431619  * (Global.day-1)) * rand_range(0.95, 1.05))
	else:
		supply_price = round(price_array[Global.day-1] * rand_range(0.95, 1.05))
       $"prod info/stock/HBoxContainer2/stock".set_text(stock_text % units)
       $"prod info/price/HBoxContainer2/supply_price".set_text(supply_text % supply_price)
       $"prod info/name/HBoxContainer/prod_name".set_text(product_name)
       
func _on_Button_pressed():
       var bought_stock = int($"input price/LineEdit".get_text())
       _buy_units(bought_stock)
