extends Node2D

var directionToRight
var volume1 = 100
var volume2 = 100
var player1Speed = 5
var player2Speed = 5
var halfSizeY = 80
var damageColor : Color = Color(209,247,0,100)
#var borderUp = 80
#var borderDown = 80
func _ready():
	pass
func _on_start_pressed():
	get_tree().change_scene_to_file("res://gameArea.tscn")
