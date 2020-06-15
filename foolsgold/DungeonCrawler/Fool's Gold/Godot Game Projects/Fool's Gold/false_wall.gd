extends StaticBody2D


#mOVING WALLS 
onready var timer = $Timer
onready var area = $Area2D

func _ready():
	pass 


func _input(_event):
	if Input.is_action_just_pressed("ui_enter"):
		var bodies = $Area2D.get_overlapping_bodies()
		for b in bodies:
			if b.name == "obj_player":
				timer.start()




func _on_Timer_timeout():
	$AnimatedSprite.play("open")
