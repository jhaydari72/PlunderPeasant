extends StaticBody2D

onready var timer = $Timer


func _on_fake_torch2_light_on2():
	$AnimatedSprite.play("open")
	timer.start()

