extends KinematicBody2D

export var ACCELERATION = 300
export var SPEED = 50
export var FRICTION = 200
export var RANGE = 4

enum {
	IDLE,
	WANDER,
	DEAD,
	CHASE
}
var velocity = Vector2.ZERO
var state = CHASE 
var is_dead = false
var knockback = Vector2.ZERO

onready var sprite = $Sprite
onready var playerdetection = $PlayerDetection
onready var hurtbox = $Hurtbox
onready var controller = $Wander

func _ready():
	state = new_state([IDLE, WANDER])
	

func _physics_process(delta):
	
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			$Sprite.play("idle")
			find_player()
			
			if controller.time_left() == 0:
				state = new_state([IDLE, WANDER])
				controller.start_wander_timer(rand_range(1, 3))
		
		WANDER:
			
			$Sprite.play("walk")
			find_player()
			
			if controller.time_left() == 0:
				state = new_state([IDLE, WANDER])
				controller.start_wander_timer(rand_range(1, 3))
				
			var direction = global_position.direction_to(controller.target_position)
			velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta)
			sprite.flip_h = velocity.x > 0
			if global_position.distance_to(controller.target_position) <= RANGE:
				state = new_state([IDLE, WANDER])
				controller.start_wander_timer(rand_range(1, 3))
			
		DEAD:
			if is_dead == true:
				velocity = Vector2(0, 0)
				$Sprite.play("dead")
		CHASE:
			var player = playerdetection.player
			if player != null:
				$Sprite.play("walk")
				var direction = global_position.direction_to(player.global_position)
				velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta)
			else:
				state = IDLE
			sprite.flip_h = velocity.x > 0
	velocity = move_and_slide(velocity)
	
func new_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
		
func find_player():
	if playerdetection.can_see_player():
		state = CHASE
	
	
func _on_Hurtbox_area_entered(area):
	knockback = area.knockback_vector * 200
	is_dead = true
	state = DEAD

