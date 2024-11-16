extends Area2D

@onready var game_manager: Node = %GameManager

func _on_body_entered(body):
	print("+1 coin") 
	game_manager.increment_score()
	queue_free()# Replace with function body.
