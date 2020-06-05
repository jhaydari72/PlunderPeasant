extends StaticBody2D

onready var sprite = $Sprite

func _ready():
	$Area2D.connect("body_entered",self,"body_entered")

func body_entered(body):
	if body.name == "obj_player" && body.get("Key") > 0:
		body.Key -= 1
		$Sprite.play("open")
