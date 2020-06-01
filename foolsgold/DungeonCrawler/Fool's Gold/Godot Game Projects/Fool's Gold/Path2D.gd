extends Path2D

onready var follow = get_node("PathFollow2D")


# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

func _process(delta):
	follow.set_offset(follow.get_offset() + 50 * delta)

# deletes pathing enemy
func _on_Hurtbox_area_entered(area):
	queue_free()
