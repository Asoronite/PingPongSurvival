extends CharacterBody2D



			
var starting_player = randi_range(1,2)


func _ready():
	
	match starting_player:
		1:
			Main.directionToRight = false
		2:
			Main.directionToRight = true

func ballMovement():
	
	if Main.directionToRight == true:
		self.position.x += 5
	elif Main.directionToRight == false:
		self.position.x -= 5
	
	
	
func _physics_process(delta):
			
	ballMovement()
	
	move_and_slide()
