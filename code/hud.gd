extends CanvasLayer

@onready var counter = $Counter

func _ready():
	visible = true
	var game_manager = get_node("%GameManager")
	game_manager.updated_score.connect(_on_score_updated)
	
func _on_score_updated(current_score: int):
	counter.text = str(current_score)

func _input(event):
	if event.is_action_pressed("exit"):
		exit_game()
	elif event.is_action_pressed("change_window_size"):
		change_window_size()
		
func exit_game():
	get_tree().quit()
	
func change_window_size():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
