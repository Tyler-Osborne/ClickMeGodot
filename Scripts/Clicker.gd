extends TextureButton

onready var game = get_node("/root/Game")
var baseCost = 10
var currentLevel : int

func _ready():
	# load settings from save file maybe?
	$Label.text = "Click For +" + str(BaseValues.ownedClickers) + " Point(s)\n" +\
		"Level: " + str(BaseValues.ownedClickers)

func _process(_delta):
	$Label.text = "Click For +" + str(BaseValues.ownedClickers) + " Point(s)\n" +\
		"Level: " + str(BaseValues.ownedClickers)

func OnClick():
	game.currentPoints += BaseValues.ownedClickers

func CalculateCost():
	return baseCost * pow(BaseValues.MULTIPLIER, currentLevel)
