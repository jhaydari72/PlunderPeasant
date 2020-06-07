extends KinematicBody2D

export var ACCELERATION = 300
export var SPEED = 50
export var FRICTION = 200
enum {
	WALK,
	CHASE
}
var velocity = Vector2.ZERO
var state = CHASE 
var is_dead = false
var knockback = Vector2.ZERO

onready var sprite = $Sprite
onready var playerdetection = $PlayerDetection


func _ready():
	pass 
	

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	match state:
		WALK:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			find_player()
		CHASE:
			var player = playerdetection.player
			if player != null:
				var direction = (player.global_position - global_position).normalized()
				velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta)
	velocity = move_and_slide(velocity)
	
		
func find_player():
	if playerdetection.can_see_player():
		state = CHASE
	
	
func _on_Hurtbox_area_entered(area):
	knockback = area.knockback_vector * 200
	is_dead = true
	velocity = Vector2(0, 0)
	$Sprite.play("dead")

