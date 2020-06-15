extends KinematicBody2D
#https://www.youtube.com/watch?v=Z9aR9IiiHT8
#this tutorial is the crux of the movement and sprite changing
const ACCELERATION = 500
const MAX_SPEED = 50
const FRICTION = 500
 


enum {
	MOVE,
	ATTACK,
	DEATH
}
var state = MOVE
var Key = 0
var velocity = Vector2.ZERO
var kill_direction = Vector2.LEFT
var health = 5
var value = null
var knockback = Vector2.ZERO

#these signal the different nodes for specific purposes
onready var player_anim = $player_anim
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordhitbox = $HitboxPivot/SwordHitbox
onready var time = $Timer
onready var hurtbox = $Hurtbox

func _ready():
	randomize()
	animationTree.active = true
	swordhitbox.knockback_vector = velocity

#this function is called every frame of the game
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	Key = min(Key, 9)
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)

#movement states
func move_state(delta):
	var input_vector = Vector2.ZERO
	
	#movement
	input_vector.x = Input.get_action_strength("ui_d") - Input.get_action_strength("ui_a")
	input_vector.y = Input.get_action_strength("ui_s") - Input.get_action_strength("ui_w")
	input_vector = input_vector.normalized()
	
	if input_vector.x != 0 or input_vector.y != 0:
		var MusicNode = $walking_sound
		MusicNode.play()
	
	# gives speed and animations
	if input_vector != Vector2.ZERO:
		kill_direction = input_vector
		swordhitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Death/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		var MusicNode = $AudioStreamPlayer2D
		MusicNode.play()

	if health <= 0:
		animationState.travel("Death")
		state = DEATH
		$Timer.start()
		var MusicNode = $AudioStreamPlayer2D2
		MusicNode.play()
	
func attack_state(_delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE


func _on_Hurtbox_area_entered(area):
	health -= 1
	hurtbox.start_invincibility(0.5)
	knockback = area.knockback_vector * 200
	
	

#This function will make the player take damage from the rats

func _on_Rat_Attack_Player(body):
	if body.name == "obj_player":
		health -= 1
		
	
	
	
func _on_Timer_timeout():
	value = get_tree().change_scene("res://GameOver/GameOver.tscn")
	return value



func _on_Heart_body_entered(_body):
	health = health + 1


func _on_Key_body_entered(_body):
	Key += 1


func _on_Ghost_body_entered(body):
	if body.name == "obj_player":
		health -= 1
		
