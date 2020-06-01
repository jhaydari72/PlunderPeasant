extends Label

var Key = 0

func _ready():
	text = String(Key) 


func _on_Key_collected():
	Key = Key + 1
	_ready()
	
	
