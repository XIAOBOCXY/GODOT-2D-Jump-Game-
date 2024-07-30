extends Node
@onready var label_score = $LabelScore

var score = 0


@onready var kill_zone = $"../KillZone"
@onready var player = $"../Player"
@onready var slime_1 = $"../Slimes/Slime1/KillZone"
@onready var slime_2 = $"../Slimes/Slime2/KillZone"
@onready var slime_3 = $"../Slimes/Slime3/KillZone"
@onready var save_point_1 = $"../SavePoints/SavePoint1"

		
func _ready():
	kill_zone.isdied.connect(Callable(player,"changedied"))
	slime_1.isdied.connect(Callable(player,"changedied"))
	slime_2.isdied.connect(Callable(player,"changedied"))
	slime_3.isdied.connect(Callable(player,"changedied"))
	save_point_1.InSavePoint.connect(Callable(player,"save"))
	
func add_point():
	score += 1
	print("You Collect " + str(score) + " Coins!")
	label_score.text = "You Collect " + str(score) + " Coins!"


