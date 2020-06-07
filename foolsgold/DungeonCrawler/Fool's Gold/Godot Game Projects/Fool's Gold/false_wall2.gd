extends StaticBody2D

#mOVING WALLS 

func _ready():
	pass 


func _on_Area2D_area_entered(_area):
	$AnimatedSprite.play("open")

