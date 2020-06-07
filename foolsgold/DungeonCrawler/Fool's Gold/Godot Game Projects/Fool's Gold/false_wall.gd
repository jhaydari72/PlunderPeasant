extends StaticBody2D


onready var animation = $AnimatedSprite

func _ready():
	pass





func _on_Area2D_area_entered(_area):
	$AnimatedSprite.play("open")



