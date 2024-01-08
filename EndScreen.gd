extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_again_pressed():
	Main.volume1 = 100
	Main.volume2 = 100
	Main.player1Speed = 5
	Main.player2Speed = 5
	Main.halfSizeY = 80
	get_tree().change_scene_to_file("res://Main.tscn")



func _on_exit_pressed():
	get_tree().quit()
