extends Label


#this code will make the player walk on top of the loot and able to pick up.
#Money bags will count up every time the players picks it up 

#varible for bags 
var bags = 0

func _ready():
	text = String(bags) 

#money count set up 
func _on_obj_bag_collected():
	bags = bags + 25
	_ready()
	
	


#referrence from BornCG
#https://www.youtube.com/watch?v=rS-PcTTiGtA
