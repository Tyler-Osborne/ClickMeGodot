extends Node

var currentPoints: int
onready var Points = $UI/Points
onready var Upgrader = $UI/UpgradeColumn/AutoUpgrade

func _ready():
	pass

func _process(_delta):
	Points.bbcode_text = "[center]Points: " + str(currentPoints) + "[center]"

	if (currentPoints >= Upgrader.CalculateCost()):
		Upgrader.visible = true
		Upgrader.disabled = false
