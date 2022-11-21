extends RigidBody2D

const speed = 400
var direction = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var collision_result = move_and_collide(direction * speed * delta)
	# TODO: figure out how to grab the unity that the bullet collided with using
	# _on_body_entered or on_area_entered and check if it's in the group "player"
	# then call the take_damage() method
	if collision_result != null:
		queue_free()
