extends Node

var score = 0

@onready var label_score = $LabelScore

func increment_score() :
	score += 1
	print(score)
	label_score.text = "Has conseguido\n"+str(score)+" monedas."
