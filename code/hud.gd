extends CanvasLayer

@onready var counter = $Counter

func _ready():
	visible = true
	var game_manager = get_node("%GameManager")
	game_manager.updated_score.connect(_on_score_updated)
	
func _on_score_updated(current_score: int):
	counter.text = str(current_score)
