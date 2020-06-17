extends StaticBody2D

#mOVING WALLS 
onready var timer = $Timer


func _ready():
	pass 




func _on_Area2D_area_entered(_area):
	$AnimatedSprite.play("open")
	timer.start()
