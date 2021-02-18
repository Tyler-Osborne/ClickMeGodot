extends TextureButton

# onready var game = get_node("/root/Game")
var baseCost = 10
var currentLevel : int

func _ready():
	# load settings from save file maybe?
	$Label.text = "Click For +" + str(Persist.ownedClickers) + " Point(s)\n" +\
		"Level: " + str(Persist.ownedClickers)

func _process(_delta):
	$Label.text = "Click For +" + str(Persist.ownedClickers) + " Point(s)\n" +\
		"Level: " + str(Persist.ownedClickers)

func OnClick():
	Persist.currentPoints += Persist.ownedClickers