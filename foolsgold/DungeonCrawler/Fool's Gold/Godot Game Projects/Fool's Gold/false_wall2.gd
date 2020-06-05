extends StaticBody2D



func _ready():
	pass 


func _on_Area2D_area_entered(area):
	$AnimatedSprite.play("open")


func _on_Area2D_area_exited(area):
	$AnimatedSprite.play("closed")
