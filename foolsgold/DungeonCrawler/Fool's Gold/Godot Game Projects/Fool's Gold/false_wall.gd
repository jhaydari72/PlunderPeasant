extends StaticBody2D


onready var animation = $AnimatedSprite

func _ready():
	pass





func _on_Area2D_area_entered(area):
	$AnimatedSprite.play("open")


func _on_Area2D_area_exited(area):
	$AnimatedSprite.play("closed")
