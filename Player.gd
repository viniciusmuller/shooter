extends CharacterBody2D

@export var speed = 200
@export var bullet_speed = 400

var bullet = preload("res://Bullet.tscn")
	
func _draw():
	draw_line(Vector2.ZERO, get_local_mouse_position(), Color.MAGENTA, 4.0)

func shoot():
	var mouse_position = get_viewport().get_mouse_position()
	var bullet_instance = bullet.instantiate()
	get_tree().get_root().add_child(bullet_instance)
	var mouse_angle = position.angle_to_point(get_global_mouse_position())
	bullet_instance.global_position = $Gun/Barrel.global_position
	bullet_instance.direction = (get_global_mouse_position() - global_position).normalized()
	bullet_instance.rotation = rotation

func process_input():
	velocity = Vector2()
	
	var multiplier = 1
	
	if Input.is_action_just_pressed("dash"):
		speed = 1000
	
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1
		
	if Input.is_action_just_pressed("shoot"):
		shoot()

	velocity = velocity.normalized() * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	process_input()
	$Gun.look_at(get_global_mouse_position())
	move_and_slide()
	queue_redraw()
