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

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var spider = $Barrel
onready var enemy_hitbox = $enemy_hitbox
onready var sprite = $Barrel
onready var playerdetection = $PlayerDetection
onready var hurtbox = $Hurtbox
onready var controller = $Wander

# Called when the node enters the scene tree for the first time.
func _ready():
	state = BARREL


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	match state:
		BARREL:
			pass
		
		SPIDERWANDER:
			
			$Barrel.play("walk")
			find_player()
		
		SPIDERDEAD:
			if is_dead == true:
				velocity = Vector2(0, 0)
				$Barrel.play("dead")
		SPIDERCHASE:
			var player = playerdetection.player
			if player != null:
				$Barrel.play("walk")
				accelerate_towards_point(player.global_position, delta)
			else:
				state = BARREL
	velocity = move_and_slide(velocity)

func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * SPEED, ACCELERATION * delta)
	sprite.flip_h = velocity.x > 0
	
func find_player():
	if playerdetection.can_see_player():
		state = SPIDERCHASE

func _on_Hurtbox_area_entered(_area):
	spider.play("spider")


func _on_Barrel_frame_changed():
	state = SPIDERCHASE
