extends AnimatedSprite2D

@export var impulse_force = 500

@onready var bouncy_sound = $BouncySound

func _on_area_2d_body_entered(body):
	body.apply_uppward_impulse(impulse_force)
	bouncy_sound.play()
	play("enabled")
