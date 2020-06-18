extends Label

var hearts = 7




func _ready():
	text = String(hearts) 
	
	
func _on_Heart_heartCount():
	hearts = hearts + 1
	_ready()
	
	
	


func _on_obj_player_health_loss():
	hearts -= 1
	_ready()
