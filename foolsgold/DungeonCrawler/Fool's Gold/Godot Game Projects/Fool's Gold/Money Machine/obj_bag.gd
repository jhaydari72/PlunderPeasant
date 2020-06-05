extends Area2D


#signal is need to pick up the money bags 
signal bagsCollected

func _ready():
	pass 
	

#this code make the money bag entered the players pockets
func _on_obj_bag_body_entered(body):
	if body.name == "obj_player": 
		$AnimationPlayer.play("bounce")
		
		$Timer.start()

#this timer is set up to show the animation of the players picking up the money bag 
func _on_Timer_timeout():
	emit_signal("bagsCollected")
	queue_free()
	
	
	
#referrence from BornCG
#https://www.youtube.com/watch?v=rS-PcTTiGtA
