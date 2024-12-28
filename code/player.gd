extends CharacterBody2D


const SPEED = 130.0
const RUN_SPEED = 200.0
const DIRECTION_NONE = 0

const KEY_LEFT = "move_left"
const KEY_RIGHT = "move_right"

const PLAYER_STATE_IDLE = "idle"
const PLAYER_STATE_JUMP = "jump"
const PLAYER_STATE_ROLL_JUMP = "roll_jump"
const PLAYER_STATE_RUN = "run"

@onready var animated_sprite_2d = $AnimatedSprite2D

var can_run = false
signal run_effect

func emit_run_effect():
	run_effect.emit()
	print("Run effect emited")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis(KEY_LEFT, KEY_RIGHT)
	if direction > DIRECTION_NONE:
		animated_sprite_2d.flip_h = false
	elif direction < DIRECTION_NONE:
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():	
		if direction == DIRECTION_NONE:
			animated_sprite_2d.play(PLAYER_STATE_IDLE)
		else :
			animated_sprite_2d.play(PLAYER_STATE_RUN)		
	else:
		if direction == DIRECTION_NONE:
			animated_sprite_2d.play(PLAYER_STATE_JUMP)
		else:
			animated_sprite_2d.play(PLAYER_STATE_ROLL_JUMP)

	if direction:
		velocity.x = direction * (RUN_SPEED if can_run or Input.is_action_pressed("run") else SPEED)
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func activate_material(new_material: Material):
	animated_sprite_2d.material = new_material
	
func apply_uppward_impulse(impulse_value: float):
	velocity.y = -impulse_value
