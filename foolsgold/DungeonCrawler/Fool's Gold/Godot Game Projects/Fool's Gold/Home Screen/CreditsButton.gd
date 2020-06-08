extends Button

var value = null

func _ready():
	pass 
	


func _on_CreditsButton_pressed():
	value = get_tree().change_scene("res://Credit Screen/CreditScreen.tscn")
	return value
