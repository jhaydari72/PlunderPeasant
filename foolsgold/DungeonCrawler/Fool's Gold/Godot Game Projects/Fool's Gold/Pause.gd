extends Control
	
var value = null
	


	
func _input(event):
	if event.is_action_pressed("pause"):
		var new_pause_state = not get_tree().paused
		get_tree().paused = new_pause_state
		visible = new_pause_state
		

func _on_QuitGame_pressed():
	value = get_tree().change_scene("res://Home Screen/HomeScreen.tscn")
	var new_pause_state = not get_tree().paused
	get_tree().paused = new_pause_state
	visible = new_pause_state
	return value
	
