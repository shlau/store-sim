extends Node

func move(player, delta):
	print("move called")
	var velocity = player.velocity
	var direction = player.direction
	
	# Adding velocity
	if velocity.length() > 0:
		print("velocity > 0")
		player.velocity = velocity.normalized() * player.speed
		
		# Set walking animation and direction
		if velocity.x > 0:
			player.animation.set_current_animation("Walk_right")
			player.direction = 2
		elif player.velocity.x < 0:
			player.animation.set_current_animation("Walk_left")
			player.direction = 1
		elif player.velocity.y > 0:
			player.animation.set_current_animation("Walk_down")
			player.direction = 0
		elif player.velocity.y < 0:
			player.animation.set_current_animation("Walk_up")
			player.direction = 3
	else:
		print("velocity is 0")
		# Set idle direction
		faceDirection(player, direction)
	
	# Move sprite
	player.position += player.velocity * delta
	
	# Making sure player doesn't leave the screen
	var margin = 10
	player.position.x = clamp(player.position.x, margin, player.screen_size.x-margin)
	player.position.y = clamp(player.position.y, margin, player.screen_size.y-margin)
	
func faceDirection(player, direction):
	match direction:
		0:
			player.animation.set_current_animation("Idle_down")
		1:
			player.animation.set_current_animation("Idle_left")
		2:
			player.animation.set_current_animation("Idle_right")
		3:
			player.animation.set_current_animation("Idle_up")