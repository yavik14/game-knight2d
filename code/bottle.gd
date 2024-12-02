extends Sprite2D

@onready var powerup_sound: AudioStreamPlayer = $PowerupSound
@onready var collision_shape = $Area2D/CollisionShape2D

func _on_area_2d_body_entered(body):
	print("Botella recogida")
	powerup_sound.play()
	self.visible = false
	collision_shape.call_deferred("set", "disabled", true)
	body.emit_run_effect()

func _on_powerup_sound_finished():
	queue_free()
