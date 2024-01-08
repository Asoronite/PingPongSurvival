extends CharacterBody2D



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	
	if Input.is_key_pressed(KEY_UP) && self.global_position.y >= 0 + Main.halfSizeY:
		
		self.global_position.y -= Main.player2Speed
		
	elif Input.is_key_pressed(KEY_DOWN) && self.global_position.y <= 650 - Main.halfSizeY:
		
		self.global_position.y += Main.player2Speed
		


func _on_rage_body_entered(body):
	if body.name == "Ball":
		Main.volume1 -= 1
		get_node("/root/GameArea/Player1").scale.y -= 0.01
		get_node("/root/GameArea/NodeLabels/Player1Volume").text = str(Main.volume1) + "%"
		if Main.volume1 <= 0:
			get_node("/root/GameArea/Player1").hide()
			get_node("/root/GameArea/Ball/Ball").itsOver = true
			get_node("/root/GameArea/EndScreen/Winner").text = "Player 2 Won"
			get_node("/root/GameArea/ControlRestart/TextureButton").hide()
			get_node("/root/GameArea/EndScreen").show()
		Main.directionToRight = false
		#body.velocity.y = -body.velocity.y
		
		body.velocity.x = body.velocity.y
		body.velocity.y = body.velocity.x
		get_node("/root/GameArea/Player1").modulate = Main.damageColor
		await get_tree().create_timer(0.1).timeout
		get_node("/root/GameArea/Player1").modulate = Color.WHITE
		print("Touched")
	if Input.is_key_pressed(KEY_UP) :
		body.velocity.y -= 100
		body.velocity.x += 50
		print(body.velocity.y)
	elif Input.is_key_pressed(KEY_DOWN):
		body.velocity.y += 100
		body.velocity.x -= 50
		print(body.velocity.y)
	if get_node("/root/GameArea/Ball/Ball").itsOver == true:
		get_node("/root/GameArea/Ball/Ball").global_position.x = 573
		get_node("/root/GameArea/Ball/Ball").global_position.y = 318
