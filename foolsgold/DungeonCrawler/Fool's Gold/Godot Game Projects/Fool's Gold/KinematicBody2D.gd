extends KinematicBody2D
#https://www.youtube.com/watch?v=Z9aR9IiiHT8
#this tutorial is the crux of the movement and sprite changing
const ACCELERATION = 500
const MAX_SPEED = 50
const FRICTION = 500
 
enum {
	MOVE,
	ATTACK
}
var state = MOVE
var Key = 0
var velocity = Vector2.ZERO
#these signal the different nodes for specific purposes
onready var player_anim = $player_anim
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	animationTree.active = true

#this function is called every frame of the game
func _physics_process(delta):
	Key = min(Key, 9)
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)

#movement state
func move_state(delta):
	var input_vector = Vector2.ZERO
	
	#movement
	input_vector.x = Input.get_action_strength("ui_d") - Input.get_action_strength("ui_a")
	input_vector.y = Input.get_action_strength("ui_s") - Input.get_action_strength("ui_w")
	input_vector = input_vector.normalized()
	
	# gives speed and animations
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK

func attack_state(delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE
