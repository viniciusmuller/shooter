extends CharacterBody2D

@export var speed = 200
@export var bullet_speed = 400

var bullet = preload("res://Bullet.tscn")

func shoot():
	var mouse_position = get_viewport().get_mouse_position()
	var bullet_instance = bullet.instantiate()
	get_tree().get_root().add_child(bullet_instance)
	var gun_offset = Vector2(70, 0).rotated(rotation) # TODO: Try to get this dynamically using the gun's sprite
	bullet_instance.position = get_global_position() + gun_offset;
	bullet_instance.rotation = rotation
	bullet_instance.apply_central_impulse(Vector2(bullet_speed, 0).rotated(rotation))

func process_input():
	velocity = Vector2()
	
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
	
	look_at(get_global_mouse_position())
	
	move_and_slide()