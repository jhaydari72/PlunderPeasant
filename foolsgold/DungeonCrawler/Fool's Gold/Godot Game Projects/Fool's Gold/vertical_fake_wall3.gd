extends StaticBody2D

onready var timer = $Timer


func _on_fake_torch3_light_on3():
	$AnimatedSprite.play("open")
	timer.start()
