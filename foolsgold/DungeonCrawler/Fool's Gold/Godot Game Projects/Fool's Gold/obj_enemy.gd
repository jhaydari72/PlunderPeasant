extends KinematicBody2D


onready var sprite = $Sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
	

func _on_Hurtbox_area_entered(_area):
	$Sprite.play("dead")
