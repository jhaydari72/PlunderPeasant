extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_obj_bag_body_entered(body):
	if body.name == "obj_player": 
		$AnimationPlayer.play("Key Bounce")

func _on_Timer_timeout():
	pass # Replace with function body.




#Key
