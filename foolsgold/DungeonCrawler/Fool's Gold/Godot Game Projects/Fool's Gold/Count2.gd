extends Label

var hearts = 5




func _ready():
	text = String(hearts)
	
func _physics_process(_delta):
	text = String(hearts)
	_on_Heart_heartCount()
	_on_obj_player_health_loss()
	
	
func _on_Heart_heartCount():
	hearts = hearts + 1
	_ready()
	
	
	


func _on_obj_player_health_loss():
	hearts -= 1
	_ready()
