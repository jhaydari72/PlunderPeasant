extends KinematicBody2D

export var ACCELERATION = 200
export var SPEED = 50
export var FRICTION = 500
export var RANGE = 4

enum {
	BARREL,
	SPIDERWANDER,
	SPIDERDEAD,
	SPIDERCHASE
}

var velocity = Vector2.ZERO
var state = SPIDERCHASE
var is_dead = false
var knockback = Vector2.ZERO
var kill_direction = Vector2.LEFT
var health = 2

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var spider = $Barrel
onready var hitbox = $Hitbox
onready var sprite = $Barrel
onready var playerdetection = $PlayerDetection
onready var hurtbox = $Hurtbox
onready var controller = $Wander

# Called when the node enters the scene tree for the first time.
func _ready():
	state = BARREL
	hitbox.knockback_vector = velocity


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	match state:
		BARREL:
			pass
		
		SPIDERWANDER:
			
			#$Barrel.play("walk")
			find_player()
		
		SPIDERDEAD:
			if is_dead == true:
				velocity = Vector2(0, 0)
				#$Barrel.play("dead")
		SPIDERCHASE:
			var player = playerdetection.player
			if player != null:
				#$Barrel.play("walk")
				accelerate_towards_point(player.global_position, delta)
			else:
				state = BARREL
	
	#kills spider
	if health == 0:
		queue_free()
	
	velocity = move_and_slide(velocity)
	
	if velocity != Vector2.ZERO:
		kill_direction = velocity.normalized()
		hitbox.knockback_vector = velocity.normalized()

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x > 0
	
func find_player():
	if playerdetection.can_see_player():
		state = SPIDERCHASE

func _on_Hurtbox_area_entered(area):
	spider.play("spider")
	health -= 1
	knockback = area.knockback_vector * 200


func _on_Barrel_frame_changed():
	state = SPIDERCHASE
