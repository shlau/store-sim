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

var entrance = Vector2(1033, 915)
var backdoor = Vector2(330,95)
var register = [Vector2(1022,205), Vector2(1022,335)]
var product_area = {
	1: {"employee": Vector2(490, 287), "customer": Vector2(490, 330)},
	2: {"employee": Vector2(610, 287), "customer": Vector2(610, 330)},
	3: {"employee": Vector2(490, 287), "customer": Vector2(490, 380)},
	4: {"employee": Vector2(610, 287), "customer": Vector2(610, 380)},
	5: {"employee": Vector2(490, 287), "customer": Vector2(490, 430)},
	6: {"employee": Vector2(610, 287), "customer": Vector2(610, 430)},
	7: {"employee": Vector2(1450, 735), "customer": Vector2(288, 330)},
	8: {"employee": Vector2(1570, 735), "customer": Vector2(478, 330)},
	9: {"employee": Vector2(1450, 735), "customer": Vector2(671, 380)},
	10: {"employee": Vector2(1570, 735), "customer": Vector2(1248, 380)},
	11: {"employee": Vector2(1450, 735), "customer": Vector2(1438, 430)},
	12: {"employee": Vector2(1570, 735), "customer": Vector2(1628, 430)},
}

var lines = {
	"register":[],
	"p1":[],
	"p2":[],
	"p3":[],
	"p4":[],
	"p5":[],
	"p6":[],
	"p7":[],
	"p8":[],
	"p9":[],
	"p10":[],
	"p11":[],
	"p12":[]
}

var player

var employees_max
var employees 
var customers
var count = 0
var max_cust = 30

func _ready():
	randomize()
	employees_max = 12
	employees = []
	customers = []
	setup_characters()
	
	player = $Player
	
func setup_characters():
#	for i in range(12):
#		employees.append(add_npc(product_area[i+1]["employee"]))
		
	for i in range(12):
		customers.append(add_npc("customer", product_area[i+1]["customer"]))
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
		lines["register"].append(npc)
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
	if lines["register"].size() >= 1:
		var customer = lines["register"][0]
		Global.money += customer.offer # add earnings to global
		move_npc(customer, entrance) # send customer to entrance
		lines["register"].remove(0)# remove customer from list
	else:
		print("no customers are at the register")