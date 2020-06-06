extends Button

#Play button press
func _ready():
	pass 

func _on_PlayButton_pressed():
	get_tree().change_scene("res://Dungeon map.tscn")
