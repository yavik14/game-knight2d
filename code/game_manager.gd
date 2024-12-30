extends Node

var score = 0

@onready var label_score = $LabelScore

signal updated_score(curren_score: int)

func increment_score() :
	score += 1
	print(score)
	updated_score.emit(score)
	label_score.text = "Has conseguido\n"+str(score)+" monedas."
