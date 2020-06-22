extends KinematicBody2D

export var ACCELERATION = 200
export var SPEED = 50
export var FRICTION = 500
export var RANGE = 4

enum {
	BARREL,
	SPIDERIDLE,
	SPIDERWANDER,
	SPIDERDEAD,
	SPIDERCHASE,
	HEART
}

var velocity = Vector2.ZERO
var state = BARREL
var is_dead = false
var knockback = Vector2.ZERO
var kill_direction = Vector2.LEFT
var health = 2
var rng = RandomNumberGenerator.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var spider = $AnimatedSprite
onready var hitbox = $Hitbox
onready var enemy_detect = $enemy_detect
onready var hurtbox = $Hurtbox
onready var controller = $Wander
onready var Heart = $Hearts

# Called when the node enters the scene tree for the first time.
func _ready():
	state = BARREL
	hitbox.knockback_vector = velocity
	rng.randomize()
	




func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	match state:
		BARREL:
			pass
		SPIDERIDLE:
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			spider.play("idle")
			find_player()
			
			if controller.time_left() == 0:
				update_state()
		
		SPIDERWANDER:
			
			find_player()
			
			if controller.time_left() == 0:
				update_state()
				
			accelerate_towards_point(controller.target_position, delta)
			
			if global_position.distance_to(controller.target_position) <= RANGE:
				update_state()
		
		SPIDERDEAD:
			if is_dead == true:
				velocity = Vector2(0, 0)
				#$Barrel.play("dead")
		SPIDERCHASE:
			var player = enemy_detect.player
			if player != null:
				spider.play("attack")
				accelerate_towards_point(player.global_position, delta)
			else:
				state = SPIDERWANDER
	velocity = move_and_slide(velocity)
	
	
	if velocity != Vector2.ZERO:
		kill_direction = velocity.normalized()
		hitbox.knockback_vector = velocity.normalized()
	
	#kills spider
	if health == 0:
		queue_free()
	

func new_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()
	
func update_state():
	state = new_state([SPIDERIDLE, SPIDERWANDER])
	controller.start_wander_timer(rand_range(1, 3))

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta)
	spider.flip_h = velocity.x > 0
	
func find_player():
	if enemy_detect.can_see_player():
		state = SPIDERCHASE

func _on_Hurtbox_area_entered(area):
	spider.play("idle")
	health -= 1
	knockback = area.knockback_vector * 200


func _on_AnimatedSprite_frame_changed():
	find_player()

func Hearts():
	var my_random_number = rng.randf_range(1.0, 2.0)
	if my_random_number == 1.0:
		match state:
			BARREL:
				pass
