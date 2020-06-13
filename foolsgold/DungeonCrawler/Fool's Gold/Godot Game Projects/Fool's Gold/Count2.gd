extends Label

var hearts = 5




func _ready():
	text = String(hearts) 
	
	
func _on_Heart_heartCount():
	hearts = hearts + 1
	_ready()
	


func _on_Hurtbox_area_entered(_area):
	hearts -= 1
	_ready()
	
	
