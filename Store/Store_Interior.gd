extends Node2D

#     B    R 
#   1   2     3   4
#   5   6     7   8
#   9   10    11  12
#          E
#var entrance # Vector2()
#var backdoor # Vector2()
#var register # [[top, bottom]]
#var product_area # {1:[top,bottom], 2:[Vector2(),Vector2()], ...}

var entrance = Vector2(963, 983)
var backdoor = Vector2(444,45)
var register = [Vector2(960,157), Vector2(963,288), Vector2(960,350)]
var product_area = {
	1: {"employee": Vector2(288, 287), "customer": [Vector2(288, 416), Vector2(288, 481)]},
	2: {"employee": Vector2(478, 287), "customer": [Vector2(478, 416), Vector2(478, 481)]},
	3: {"employee": Vector2(671, 287), "customer": [Vector2(671, 416), Vector2(671, 481)]},
	4: {"employee": Vector2(1248, 287), "customer": [Vector2(1248, 416), Vector2(1248, 481)]},
	5: {"employee": Vector2(1438, 287), "customer": [Vector2(1438, 416), Vector2(1438, 481)]},
	6: {"employee": Vector2(1628, 287), "customer": [Vector2(1628, 416), Vector2(1628, 481)]},
	7: {"employee": Vector2(288, 735), "customer": [Vector2(288, 864), Vector2(288, 928)]},
	8: {"employee": Vector2(478, 735), "customer": [Vector2(478, 864), Vector2(478, 928)]},
	9: {"employee": Vector2(671, 735), "customer": [Vector2(671, 864), Vector2(671, 928)]},
	10: {"employee": Vector2(1248, 735), "customer": [Vector2(1248, 864), Vector2(1248, 928)]},
	11: {"employee": Vector2(1438, 735), "customer": [Vector2(1438, 864), Vector2(1438, 928)]},
	12: {"employee": Vector2(1628, 735), "customer": [Vector2(1628, 864), Vector2(1628, 928)]},
}

var player

var employees_max
var employees 
var customers

func _ready():
	employees_max = 12
	employees = []
	customers = []
	setup_characters()
	
func setup_characters():
#<<<<<<< HEAD
#	add_player(entrance)
	for i in range(12):
		employees.append(add_npc(product_area[i+1]["employee"]))
		
	for i in range(12):
		customers.append(add_npc(product_area[i+1]["customer"][0]))
#	employees.append(add_npc(backdoor))
	move_npc(customers[0], register[1])
#	move_npc(customers[1], register[2])

#=======
#	add_player(entrance)
#	employees["reg1"] = add_npc(register[0])
#	employees["reg2"] = add_npc(backdoor)	
#	move_npc(employees["reg1"],entrance)
#	move_npc(employees["reg2"],entrance)
#>>>>>>> 86d1bc65077375a417056d8ea0850521e7e04d4d
func add_player(spawn):
	player = preload("res://Characters/Player.tscn").instance()
	player.init(spawn)
	add_child(player)

func add_npc(spawn):
	var inpc =  preload("res://Characters/NPC.tscn").instance()
	var name = "npc" + str(employees.size())
	inpc.set_name(name)
	add_child(inpc)
	inpc.init(name, spawn)
	return inpc

func _process(delta):
#	for npc in employees:
#		var velocity = npc.velocity
#		var collision = npc.move_and_collide(velocity * delta/2)
		
#		if collision != null:
#			if collision.get_collider().name == 'Player':
#				print(collision.get_collider().name)
#			print(collision.get_collider().get_class() == 'KinematicBody2D')
#			if npc.path.size() > 0:
#				update_path(npc, npc.path[-1])
#			else:
#				update_path(npc, npc.last_location)
#			print(npc.path)
	pass

func move_npc(npc, location):
	var path = get_node("Navigation2D").get_simple_path(npc.position, location)
	npc.add_destinations(path)

func update_path(npc, location):
	var path = get_node("Navigation2D").get_simple_path(npc.position, location)
	npc.clear_path()
	npc.add_destinations(path)