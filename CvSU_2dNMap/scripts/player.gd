extends KinematicBody2D

const speed = 200
var current_dir = "none"
var velocity = Vector2.ZERO  # Define velocity manually

func _ready():
	$AnimatedSprite.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	# Use the velocity for movement
	velocity = move_and_slide(velocity)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity = Vector2(speed, 0)
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity = Vector2(-speed, 0)
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity = Vector2(0, speed)
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity = Vector2(0, -speed)
	else:
		play_anim(0)
		velocity = Vector2.ZERO

	print("Velocity: ", velocity)

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite
	
	# Debugging print statements
	if anim == null:
		print("Error: AnimatedSprite2D node not found!")
		return

	print("Current direction: ", dir)
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	elif dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	elif dir == "down":
		anim.flip_h = false
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	elif dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
