extends CharacterBody2D


var speed = 130.0
const JUMP_VELOCITY = -300.0
const JUMP_MAX = 2
var JumpCount = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D

var isdied = false
var savepositionx = position.x
var savepositiony = position.y

func _ready():
	pass
	
func changedied():
	isdied = true	
	position.x=savepositionx
	position.y=savepositiony
	print("死亡",savepositionx," ",savepositiony)

func save():
	print("save前",savepositionx," ",savepositiony)
	isdied = false
	savepositionx = position.x
	savepositiony = position.y
	print("save后",savepositionx," ",savepositiony)
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_floor():
		JumpCount = 0
	# Handle jump.
	if JumpCount < JUMP_MAX:
		if Input.is_action_just_pressed("Jump") and not isdied:
			velocity.y = JUMP_VELOCITY
			JumpCount += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("MoveLeft", "MoveRight")

		
	if direction < 0 :
		animated_sprite_2d.flip_h = true
	elif direction > 0:
		animated_sprite_2d.flip_h = false
	if is_on_floor() :
		if direction == 0:
			animated_sprite_2d.play("idle")
			speed = 130
		else:
			if Input.is_action_pressed("Roll"):
				animated_sprite_2d.play("roll")
				speed = 250
			else:
				animated_sprite_2d.play("run")
				speed = 130
	else:
		animated_sprite_2d.play("jump")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()


