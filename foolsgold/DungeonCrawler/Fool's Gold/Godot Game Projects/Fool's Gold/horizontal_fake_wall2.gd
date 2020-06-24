extends StaticBody2D

onready var timer = $Timer


func _on_fake_torch5_light_on5():
	$AnimatedSprite.play("open")
	timer.start()
