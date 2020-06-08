extends Button

var value = null


func _ready():
	pass 

func _on_Button_pressed():
	value = get_tree().change_scene("res://Dungeon map.tscn")
	return value
