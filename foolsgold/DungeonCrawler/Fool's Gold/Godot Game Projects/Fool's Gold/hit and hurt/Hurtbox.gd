extends Area2D

var invincible = false setget set_invincible

signal invincibility_started
signal invincibility_ended


onready var timer = $Timer



func set_invincible(value):
	invincible = value
	if invincible == true:
		emit_signal("invincibility_started")
	else:
		emit_signal("invincibility_ended")



func start_invincibility(duration):
	self.invincible = true
	$Timer.start(duration)


func _on_Timer_timeout():
	self.invincible = false


func _on_Hurtbox_invincibility_started():
	set_deferred("monitorable", false)
	invincible = false
	


func _on_Hurtbox_invincibility_ended():
	set_deferred("monitorable", true)
	invincible = true
	


func _on_Hurtbox_area_entered(_area):
	timer.start()
	queue_free()


func _on_obj_player_dead():
	queue_free()
