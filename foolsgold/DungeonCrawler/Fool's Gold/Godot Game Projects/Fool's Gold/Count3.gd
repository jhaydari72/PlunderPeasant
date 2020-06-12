extends Label

var key = 0




func _ready():
	text = String(key) 
	
	

func _on_Key_keycollected():
	key = key + 1
	_ready()
	
