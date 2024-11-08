extends Area2D

const SLOW_TIME_SCALE = 0.3
const NORMAL_TIME_SCALE = 1

@onready var timer = $Timer

func _on_body_entered(body):
	print("You loose.")
	Engine.time_scale = SLOW_TIME_SCALE
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	

func _on_timer_timeout():
	Engine.time_scale = NORMAL_TIME_SCALE
	get_tree().reload_current_scene()
