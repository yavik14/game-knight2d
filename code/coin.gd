extends Area2D

@onready var game_manager: Node = %GameManager
@onready var sound = $Sound
@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

func _on_body_entered(_body):
	print("+1 coin") 
	game_manager.increment_score()
	sound.play()
	collision_shape.call_deferred("set", "disabled", true)
