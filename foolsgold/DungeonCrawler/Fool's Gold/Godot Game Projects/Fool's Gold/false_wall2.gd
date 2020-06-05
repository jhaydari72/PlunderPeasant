extends StaticBody2D



func _ready():
	pass 


func _on_Area2D_area_entered(_area):
	$AnimatedSprite.play("open")


func _on_Area2D_area_exited(_area):
	$AnimatedSprite.play("closed")
