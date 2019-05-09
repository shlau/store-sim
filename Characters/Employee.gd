extends "res://Characters/NPC.gd"

var salary
var product_area

# Called when the node enters the scene tree for the first time.
func _ready():
	salary = 0.0
	product_area = null

func init(area):
	product_area = area