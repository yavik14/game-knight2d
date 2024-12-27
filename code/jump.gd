extends Node2D

const JUMP_VELOCITY = -300.0

var player: CharacterBody2D = null
@onready var jump_sound = $JumpSound

var is_on_coyote_time = false
var was_on_floor = false

@onready var coyote_time_timer = $CoyoteTimeTimer
@export var coyote_time_duration = 0.15

func _ready():
	player = get_parent()
	coyote_time_timer.one_shot = true
	coyote_time_timer.timeout.connect(on_coyote_time_timer)
	

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump") and (player.is_on_floor() or is_on_coyote_time):
		jump_sound.play()
		player.velocity.y = JUMP_VELOCITY
		
	if was_on_floor and not player.is_on_floor() and player.get_real_velocity().y >= 0:
		is_on_coyote_time = true
		coyote_time_timer.start(coyote_time_duration)
	
	was_on_floor = player.is_on_floor()
	

func on_coyote_time_timer():
	is_on_coyote_time = false
