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
var register = [Vector2(960,65), Vector2(963,300)]
var product_area = {
	1: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	2: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	3: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	4: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	5: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	6: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	7: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	8: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	9: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	10: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	11: [[Vector2(), Vector2()], [Vector2(), Vector2()]],
	12: [[Vector2(), Vector2()], [Vector2(), Vector2()]]
}

var player

var employees_max
var employees 

func _ready():
	employees_max = 2
	employees = {"reg1":null, "reg2":null}
	setup_characters()
	
func setup_characters():
	add_player(entrance)
	employees["reg1"] = add_npc(register[0])
	employees["reg2"] = add_npc(backdoor)

func add_player(spawn):
	player = preload("res://Characters/Player.tscn").instance()
	player.init(entrance)
	add_child(player)

func add_npc(spawn):
	var inpc =  preload("res://Characters/NPC.tscn").instance()
	inpc.init(spawn)
	add_child(inpc)
	return inpc

func move_npc(npc, location):
	var path = get_node("Navigation2D").get_simple_path(npc.position, location)
	npc.add_destinations(path)