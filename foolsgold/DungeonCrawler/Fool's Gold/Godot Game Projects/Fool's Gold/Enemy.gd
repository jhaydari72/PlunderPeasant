extends KinematicBody2D

const SPEED = 50

var velocity = Vector2()
var direction = -1
var is_dead = false
onready var sprite = $Sprite



func _ready():
	pass 
	

func _physics_process(delta):
	if is_dead == false:
		velocity.x = SPEED * direction
		if direction == 1:
			$Sprite.flip_h = true
		else:
			$Sprite.flip_h = false
			
	
		velocity = move_and_slide(velocity)
	
	if is_on_wall():
		direction = direction * -1
		

func _on_Hurtbox_area_entered(_area):
	is_dead = true
	velocity = Vector2(0, 0)
	$Sprite.play("dead")

