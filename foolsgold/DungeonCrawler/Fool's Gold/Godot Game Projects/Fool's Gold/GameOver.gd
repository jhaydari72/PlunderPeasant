extends Node2D
onready var timer = get_node("Timer")

var seconds = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(1.1)
	timer.start()
	timer = 0
	get_tree().change_scene("res://Home Screen/HomeScreen.tscn")




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
