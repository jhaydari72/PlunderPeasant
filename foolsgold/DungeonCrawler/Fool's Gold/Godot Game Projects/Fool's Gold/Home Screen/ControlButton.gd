extends Button


func _ready():
	pass 
	

func _on_MenuButton_pressed():
	get_tree().change_scene("res://ControlsScreen/Menu.tscn")
