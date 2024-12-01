extends Node

@onready var coin: Area2D = $".."
@onready var animated_sprite_2d = $"../AnimatedSprite2D"

@export var distance: float = 30
@export var duration: float = 0.5

func _ready() -> void:
	# coin.body_entered.connect(_on_body_entered)
	coin.play_destruction_animation.connect(_play_destruction_animation)
	coin.selfdestruction = false

func _play_destruction_animation():
	var tween = get_tree().create_tween().bind_node(coin).set_parallel(true)
	# Animacion con transposicion hacia arriba de la moneda
	tween.tween_property(coin, "position", coin.position + Vector2.UP * distance, duration).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	# Animacion desvanecerse el sprite
	tween.tween_property(animated_sprite_2d, "self_modulate", Color(Color.WHITE, 0), duration)
	# Esperar a finalizar la animacion
	await tween.finished
	coin.queue_free()
