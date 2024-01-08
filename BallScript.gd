extends CharacterBody2D



			
var starting_player = randi_range(1,2)
var velocityStarting = Vector2(200, 0)
var itsOver = false

func _ready():
	get_node("/root/GameArea/EndScreen").hide()
	self.velocity.y = randi_range(-250,250)
	match starting_player:
		1:
			Main.directionToRight = false
		2:
			Main.directionToRight = true


func ballMovement():
	#self.velocity.x=100
	if Main.directionToRight == true:
		#self.position.x += 5 
		self.velocity.x = 500
		#self.position.x += 5 * velocityStarting.normalized()
		
	elif Main.directionToRight == false:
		
		#self.position.x -= 5
		#self.positio.x = -400
		self.velocity.x = -500

func _on_rage_ball_area_entered(area):
	if area.name == "ScoreWalls":
		
		if Main.directionToRight :
			if Main.volume2>=10:
				Main.volume2 -= 10
			else:
				Main.volume2 -= Main.volume2
			get_node("/root/GameArea/NodeLabels/Player2Volume").text = str(Main.volume2) + "%"
			Main.player2Speed +=1
			Main.halfSizeY -= Main.halfSizeY * 0.1
			get_node("/root/GameArea/Player2").scale.y -= 0.1
			get_node("/root/GameArea/Player2").modulate = Main.damageColor
			await get_tree().create_timer(0.1).timeout
			get_node("/root/GameArea/Player2").modulate = Color.WHITE
			print("Score2 =" , Main.volume2)
			if Main.volume2 <= 0:
				get_node("/root/GameArea/Player2").hide()
				itsOver = true
				get_node("/root/GameArea/EndScreen/Winner").text = "Player 1 Won"
				get_node("/root/GameArea/ControlRestart/TextureButton").hide()
				get_node("/root/GameArea/EndScreen").show()
				
		
		elif Main.directionToRight == false:
			if Main.volume1>=10:
				Main.volume1 -= 10
			else:
				Main.volume1 -= Main.volume1
			get_node("/root/GameArea/NodeLabels/Player1Volume").text = str(Main.volume1) + "%"
			Main.player1Speed +=1
			Main.halfSizeY -= Main.halfSizeY * 0.1
			get_node("/root/GameArea/Player1").scale.y -= 0.1
			get_node("/root/GameArea/Player1").modulate = Main.damageColor
			await get_tree().create_timer(0.1).timeout
			get_node("/root/GameArea/Player1").modulate = Color.WHITE
			print("Score1 =" , Main.volume1)
			
			if Main.volume1 <= 0:
				get_node("/root/GameArea/Player1").hide()
				itsOver = true
				get_node("/root/GameArea/EndScreen/Winner").text = "Player 2 Won"
				get_node("/root/GameArea/ControlRestart/TextureButton").hide()
				get_node("/root/GameArea/EndScreen").show()
				
		#self.velocity = Vector2(0,0)
		self.global_position.x = 573
		self.global_position.y = 318
		self.velocity.y = randi_range(-250,250)
		
		Main.directionToRight = !Main.directionToRight
		
	elif area.name == "BounceWalls":
		self.velocity.y = -self.velocity.y
		
		
func _physics_process(delta):
	if itsOver == false:
		
		ballMovement()
		move_and_slide()


