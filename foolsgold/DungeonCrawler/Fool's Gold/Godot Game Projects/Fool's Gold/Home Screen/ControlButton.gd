extends Button

var value = null

func _ready():
	pass 
	

func _on_MenuButton_pressed():
	value = get_tree().change_scene("res://ControlsScreen/Menu.tscn")
	return value
