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
var count = 0
var max_cust = 30

var register_line
func _ready():
	randomize()
	employees_max = 12
	employees = []
	customers = []
	register_line = []
	setup_characters()
	
	player = $Player
	
func setup_characters():
#	for i in range(12):
#		employees.append(add_npc(product_area[i+1]["employee"]))
		
	for i in range(12):
		customers.append(add_npc("customer", product_area[i+1]["customer"][0]))
		move_npc(customers[i], register[1])

func add_player(spawn):
	player = preload("res://Characters/Player.tscn").instance()
	player.init(spawn)
	add_child(player)

func add_npc(type, spawn):
	var inpc
	if type == "employee":
		inpc =  preload("res://Characters/Employee.tscn").instance()
	elif type == "customer":
		inpc =  preload("res://Characters/Customer.tscn").instance()
	var name = type + str(count)
	count += 1
	inpc.set_name(name)
	add_child(inpc)
	inpc.init(name, spawn)
	return inpc

func _process(delta):
	check_player()
	check_leaving_customers()

func move_npc(npc, location):
	if location == register[1]:
		register_line.append(npc)
	var path = get_node("Navigation2D").get_simple_path(npc.position, location)
	npc.add_destinations(path)

func update_path(npc, location):
	var path = get_node("Navigation2D").get_simple_path(npc.position, location)
	npc.clear_path()
	npc.add_destinations(path)

func _on_SpawnTimeout_timeout():
	pass
#	if(customers.size() >= 2):
#		$SpawnTimeout.stop()
#	else:
#		var rand = randi()%12 + 1
#		var dest = product_area[rand]["employee"]
#		dest.y += 100
#		var npc = add_npc(entrance)
#		customers.append(npc)
#		move_npc(npc,dest)

func check_leaving_customers():
	# If the NPC is leaving the store
	var removed_customers = []
	for i in range(customers.size()):
		if (customers[i].within_area(entrance, 20) and customers[i].path.empty()): 
			customers[i].queue_free()
			print("customer ", customers[i].name, " freed")
			removed_customers.append(i)
	for i in removed_customers:
		customers.remove(i);

func check_player():
	if player:
		if player.collision: 
			var collider = player.collision.collider
			if collider.name == "Register" and player.direction == 0 and Input.is_action_just_pressed("ui_accept"):
				player_work_register()

func player_work_register():
	print("player wants to work at the register")
	if register_line.size() >= 1:
		var customer = register_line[0]
		Global.money += customer.offer # add earnings to global
		move_npc(customer, entrance) # send customer to entrance
		register_line.remove(0)# remove customer from list
	else:
		print("no customers are at the register")