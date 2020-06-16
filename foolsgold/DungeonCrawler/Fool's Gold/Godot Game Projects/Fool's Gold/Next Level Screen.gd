extends Control

var value = null

func _ready():
	pass 


func _on_Next_Level__pressed():
	value = get_tree().change_scene("res://Level Two/Second Level.tscn")
	return value 

func _on_Main_Menu_pressed():
	value = get_tree().change_scene("res://Home Screen/HomeScreen.tscn")
	return value
