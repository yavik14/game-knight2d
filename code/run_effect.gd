extends Node

@onready var player = $".."
@onready var timer_run_effect = $TimerRunEffect

@export var effect_time: int = 5

func _ready():
	player.run_effect.connect(_on_player_run_effect)
	timer_run_effect.timeout.connect(_on_timeout)
	
	
func _on_player_run_effect():
	print("Efecto iniciado")
	if timer_run_effect.time_left <= 0:
		player.can_run = true
	timer_run_effect.start(effect_time + timer_run_effect.time_left)

func _on_timeout():
	player.can_run = false
	print("Efecto eliminado")
