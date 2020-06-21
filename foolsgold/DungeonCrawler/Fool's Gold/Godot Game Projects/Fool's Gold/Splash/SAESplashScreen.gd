extends Control

var value = null



func _ready():
	pass 




func _on_Button_pressed():
	value = get_tree().change_scene("res://Home Screen/HomeScreen.tscn")
	return value



func _on_Timer_timeout():
	value = get_tree().change_scene("res://Home Screen/HomeScreen.tscn")
	return value
