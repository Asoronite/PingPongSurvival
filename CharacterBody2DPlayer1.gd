extends CharacterBody2D



var node_ball_reference




	
func _physics_process(delta):
	
	
	if Input.is_key_pressed(KEY_W) && self.global_position.y >= 0 + Main.halfSizeY:
		
		self.global_position.y -= Main.player1Speed
		
	elif Input.is_key_pressed(KEY_S) && self.global_position.y <= 650 - Main.halfSizeY:
		
		self.global_position.y += Main.player1Speed
		




func _on_rage_body_entered(body):
	if body.name == "Ball":
		Main.volume2 -= 1
		get_node("/root/GameArea/Player2").scale.y -= 0.01
		get_node("/root/GameArea/NodeLabels/Player2Volume").text = str(Main.volume2) + "%"
		if Main.volume2 <= 0:
			get_node("/root/GameArea/Player2").hide()
			get_node("/root/GameArea/Ball/Ball").itsOver = true
			get_node("/root/GameArea/EndScreen/Winner").text = "Player 1 Won"
			get_node("/root/GameArea/ControlRestart/TextureButton").hide()
			get_node("/root/GameArea/EndScreen").show()
		Main.directionToRight = true
		body.velocity.x = body.velocity.y
		body.velocity.y = body.velocity.x
		#body.pvelocity.x = 400
		
		get_node("/root/GameArea/Player2").modulate = Main.damageColor
		await get_tree().create_timer(0.1).timeout
		get_node("/root/GameArea/Player2").modulate = Color.WHITE
		print("Touched")
		print(body.velocity.y)
		
	if Input.is_key_pressed(KEY_W):
		body.velocity.y += 100
		body.velocity.x -= 50
		print(body.velocity.y)
	elif Input.is_key_pressed(KEY_S):
		body.velocity.y -= 100
		body.velocity.x += 50
		print(body.velocity.y)
	if get_node("/root/GameArea/Ball/Ball").itsOver == true:
		get_node("/root/GameArea/Ball/Ball").global_position.x = 573
		get_node("/root/GameArea/Ball/Ball").global_position.y = 318

		#node_ball_reference = get_node("/root/GameArea/Ball/Ball")
		#node_ball_reference.ballMovement()

