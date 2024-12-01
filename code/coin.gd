extends Area2D

@onready var game_manager: Node = %GameManager
@onready var sound = $Sound
@onready var animated_sprite = $AnimatedSprite2D
@onready var collision_shape = $CollisionShape2D

var selfdestruction: bool = true
signal play_destruction_animation()

func _on_body_entered(_body):
	print("+1 coin") 
	game_manager.increment_score()
	sound.play()
	collision_shape.call_deferred("set", "disabled", true)
	if selfdestruction:
		animated_sprite.visible = false
		sound.finished.connect(_on_finished)
	else:
		play_destruction_animation.emit()

func _on_finished():
	queue_free()
