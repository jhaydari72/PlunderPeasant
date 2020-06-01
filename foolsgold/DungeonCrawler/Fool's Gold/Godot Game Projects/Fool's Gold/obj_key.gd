extends RigidBody2D

#makes obj_key able to be picked up by the player
var picked = false

func _physics_process(delta):
	print(self.position)
	if picked == true:
		self.position = get_node("../Position2D").global_position

func _input(event):
	if Input.is_action_just_pressed("ui_enter"):
		var bodies = $Area2D.get_overlapping_bodies()
		for b in bodies:
			if b.name == "obj_player" and picked == false:
				picked = true
