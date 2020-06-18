extends Control

var value = null


func _ready():
	pass




func _on_Main_Menu_pressed():
	value = get_tree().change_scene("res://Home Screen/HomeScreen.tscn")
	return value
