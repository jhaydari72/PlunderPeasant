extends StaticBody2D

#mOVING WALLS 
onready var timer = $Timer


func _ready():
	pass 

	


func _on_Fake_torch_turned_on():
	$AnimatedSprite.play("open")
	timer.start()
