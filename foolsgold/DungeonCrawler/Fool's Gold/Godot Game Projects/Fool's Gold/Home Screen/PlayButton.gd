extends Button

var value = null
#Play button press
func _ready():
	pass 

func _on_PlayButton_pressed():
	value = get_tree().change_scene("res://Dungeon map.tscn")
	return value
