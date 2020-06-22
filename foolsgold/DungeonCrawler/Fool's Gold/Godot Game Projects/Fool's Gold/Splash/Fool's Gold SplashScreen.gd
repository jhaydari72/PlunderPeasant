extends Control

#Beginning splash screen

var value = null


func _ready():
	pass 
	

func _on_Button_pressed():
	value = get_tree().change_scene("res://Splash/GodotSplashScreen.tscn")
	return value
	


func _on_Timer_timeout():
	value = get_tree().change_scene("res://Splash/GodotSplashScreen.tscn")
	return value
