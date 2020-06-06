extends KinematicBody2D


onready var sprite = $Sprite

var knockback = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass 
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 500 * delta)
	knockback = move_and_slide(knockback)
	
#handles knockback
func _on_Hurtbox_area_entered(area):
	knockback = area.knockback_vector * 200
	$Sprite.play("dead")
