extends Control

var value = null


func _ready():
	pass # Replace with function body.




func _on_Button_pressed():
	value = get_tree().change_scene("res://Splash/SAESplashScreen.tscn")
	return value
	


func _on_Timer_timeout():
	value = get_tree().change_scene("res://Splash/SAESplashScreen.tscn")
	return value
	
