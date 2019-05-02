extends Node

#Scene
var current_scene = null

#Player
var curr_money = 0

#Environment
var day = 1
var debt_limit = -1000000
var goal = 1000000

#Products
var num_products = 2
var max_stock = 1000


# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	current_scene = root.get_child(root.get_child_count() - 1)

#Function to change scenes when it is safe to do so
func goto_scene(path):
	call_deferred("_deferred_goto_scene", path)

#Changes scene, but should only be used by being called by goto_scene()
func _deferred_goto_scene(path):
	current_scene.free()

	#Loaf the new scene
	var s = ResourceLoader.load(path)

	#Instance the new scene
	current_scene = s.instance()

	#Add it to the active scene, as a child of root
	get_tree().get_root().add_child(current_scene)

	#compatiable with SceneTree.change_scene() API
	get_tree().set_current_scene(current_scene)