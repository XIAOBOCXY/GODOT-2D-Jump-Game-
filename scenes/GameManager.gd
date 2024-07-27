extends Node
@onready var label_score = $LabelScore

var score = 0

func add_point():
	score += 1
	print("You Collect " + str(score) + " Coins!")
	label_score.text = "You Collect " + str(score) + " Coins!"
