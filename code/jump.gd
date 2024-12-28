extends Node2D

const JUMP_VELOCITY = -300.0

var player: CharacterBody2D = null
@onready var jump_sound = $JumpSound

var was_on_floor = false

var is_on_coyote_time = false
@onready var coyote_time_timer = $CoyoteTimeTimer
@export var coyote_time_duration = 0.15

@onready var jump_buffer_timer = $JumpBufferTimer
var is_jump_buffered_when_is_on_floor = false
@export var buffered_jump_time = 0.15

func _ready():
	player = get_parent()
	coyote_time_timer.one_shot = true
	coyote_time_timer.timeout.connect(on_coyote_time_timer)
	jump_buffer_timer.one_shot = true
	jump_buffer_timer.timeout.connect(on_jump_buffer_timer)
	

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump"):
		if(player.is_on_floor() or is_on_coyote_time):
			jump()
		else:
			is_jump_buffered_when_is_on_floor = true
			jump_buffer_timer.start(buffered_jump_time)
		
	if was_on_floor and not player.is_on_floor() and player.get_real_velocity().y >= 0:
		is_on_coyote_time = true
		coyote_time_timer.start(coyote_time_duration)
	
	if not was_on_floor and player.is_on_floor() and is_jump_buffered_when_is_on_floor:
		is_jump_buffered_when_is_on_floor = false
		jump_buffer_timer.stop()
		jump()
	
	was_on_floor = player.is_on_floor()
	
	
func jump():
	jump_sound.play()
	player.velocity.y = JUMP_VELOCITY

func on_coyote_time_timer():
	is_on_coyote_time = false
	
func on_jump_buffer_timer():
	is_jump_buffered_when_is_on_floor = false
