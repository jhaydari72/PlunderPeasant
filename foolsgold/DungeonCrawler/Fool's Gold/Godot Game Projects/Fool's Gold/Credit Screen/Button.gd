extends Button

var value = null

func _ready():
	pass 
	
	


func _on_Button_pressed():
	value = get_tree().change_scene("res://Home Screen/HomeScreen.tscn")
	return value
