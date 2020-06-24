extends Control

var value = null



func _ready():
	pass 




func _on_Button_pressed():
	value = get_tree().change_scene("res://Splash/Fool's Gold SplashScreen.tscn")
	return value



func _on_Timer_timeout():
	value = get_tree().change_scene("res://Splash/Fool's Gold SplashScreen.tscn")
	return value
