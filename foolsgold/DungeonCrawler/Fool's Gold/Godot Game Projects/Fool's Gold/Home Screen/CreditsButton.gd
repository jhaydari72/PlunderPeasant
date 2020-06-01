extends Button


func _ready():
	pass 
	


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://Credit Screen/CreditScreen.tscn")
