extends KinematicBody2D
#https://www.youtube.com/watch?v=Z9aR9IiiHT8
#this tutorial is the crux of the movement and sprite changing
const ACCELERATION = 500
const MAX_SPEED = 50
const FRICTION = 500
 
signal dead
signal health_loss

enum {
	MOVE,
	ATTACK,
	DEATH,
	HIT
}
var state = MOVE
var Key = 0
var velocity = Vector2.ZERO
var kill_direction = Vector2.LEFT
var value = null
var knockback = Vector2.ZERO

#these signal the different nodes for specific purposes
onready var player_anim = $player_anim
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordhitbox = $HitboxPivot/SwordHitbox
onready var time = $Timer
onready var hurtbox = $Hurtbox
onready var heart_count = $"Sprite/UI Layer Only/Heart Icon/Count2"

func _ready():
	randomize()
	animationTree.active = true
	swordhitbox.knockback_vector = velocity

#this function is called every frame of the game
func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	match state:
		MOVE:
			move_state(delta)
		ATTACK:
			attack_state(delta)
			dead()
		HIT:
			get_hit(delta)
			dead()

#movement states
func move_state(delta):
	var input_vector = Vector2.ZERO
	
	#movement
	input_vector.x = Input.get_action_strength("ui_d") - Input.get_action_strength("ui_a")
	input_vector.y = Input.get_action_strength("ui_s") - Input.get_action_strength("ui_w")
	input_vector = input_vector.normalized()
	
	# gives speed and animations
	if input_vector != Vector2.ZERO:
		kill_direction = input_vector
		swordhitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Death/blend_position", input_vector)
		animationTree.set("parameters/Get_hit/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
		
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
	
	#if Input.is_action_pressed("ui_d"):
		#var MusicNode = $walking_sound
		#MusicNode.play()
	#else:
		#var MusicNode = $walking_sound
		#MusicNode.stop()
	
	if Input.is_action_just_pressed("attack"):
		state = ATTACK
		var MusicNode = $AudioStreamPlayer2D
		MusicNode.play()
	dead()
	
	

#new get hit state
func get_hit(_delta):
	animationState.travel("Get_hit")
	
	
func hit_animation_finished():
	state = MOVE
	
func attack_state(_delta):
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func attack_animation_finished():
	state = MOVE


func _on_Hurtbox_area_entered(area):
	hurtbox.start_invincibility(1)
	knockback = area.knockback_vector * 200
	emit_signal("health_loss")
	state = HIT
	
	

func _on_Timer_timeout():
	value = get_tree().change_scene("res://GameOver/GameOver.tscn")
	return value

func dead():
	if heart_count.hearts == 0:
		emit_signal("dead")
		animationState.travel("Death")
		state = DEATH
		$Timer.start()
		var MusicNode = $AudioStreamPlayer2D2
		MusicNode.play()




func _on_Key_body_entered(_body):
	Key += 1

