extends Node

@onready var player = $".."
@onready var timer_run_effect = $TimerRunEffect

@export var effect_time: int = 5
@export var effect_material: Material

const DEFAULT_POWERUP_EFFECT_PITCH: float = 1
@export var powerup_effect_pitch: float = 2

func _ready():
	player.run_effect.connect(_on_player_run_effect)
	timer_run_effect.timeout.connect(_on_timeout)
	reset_pitch()
		
	
func _on_player_run_effect():
	print("Efecto iniciado")
	if timer_run_effect.time_left <= 0:
		player.can_run = true
		player.activate_material(effect_material)
		Music.pitch_scale = powerup_effect_pitch
		
	timer_run_effect.start(effect_time + timer_run_effect.time_left)


func _on_timeout():
	player.can_run = false
	player.activate_material(null)
	reset_pitch()
	print("Efecto eliminado")
	
	
func reset_pitch():
	Music.pitch_scale = DEFAULT_POWERUP_EFFECT_PITCH
