extends Node

const AutoClicker = preload("res://Scenes/AutoClicker.tscn")
onready var Points = $UI/Points
onready var AutoClickers = $UI/AutoClickColumn

func _ready():
	pass

func _process(_delta):
	Points.bbcode_text = "[center]Points: " + str(round(Persist.currentPoints)) + "[center]"
	
	if (AutoData.AutoClickData.size() - 1 >= Persist.ownedAutos):
		if (Persist.currentPoints >= AutoData.AutoClickData[Persist.ownedAutos].BaseCost):
			if (AutoData.AutoClickData[Persist.ownedAutos].Amount == 0):
				AutoClickers.add_child(AutoClicker.instance())
	
	
