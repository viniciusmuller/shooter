extends StaticBody2D

@export var player: CharacterBody2D

var bullet = preload("res://Bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.start()

func _draw():
	draw_line(Vector2.ZERO, to_local(player.position), Color.CORAL, 5.0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Gun.rotation = position.angle_to_point(player.position)
	queue_redraw()

func shoot():
	var bullet_instance = bullet.instantiate()
	get_tree().get_root().add_child(bullet_instance)
	var mouse_angle = position.angle_to_point(get_global_mouse_position())
	bullet_instance.global_position = $Gun/Barrel.global_position
	bullet_instance.direction = (player.global_position - global_position).normalized()
	bullet_instance.rotation = rotation

func _on_timer_timeout():
	print("test")
	shoot()
