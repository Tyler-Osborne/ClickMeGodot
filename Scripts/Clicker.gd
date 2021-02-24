extends TextureButton

# onready var game = get_node("/root/Game")
var baseCost = 10
var currentLevel : int
var currentThreshold: int
var currentThresholdIndex: int

func _ready():
	# load settings from save file maybe?
	currentThresholdIndex = 0
	currentThreshold = BaseValues.multiThreshold[currentThresholdIndex]
	$Label.text = "Click For +" + str(CalcPoints()) + " Point(s)\n" +\
		"Level: " + str(Persist.ownedClickers)

func _process(_delta):
	if Persist.ownedClickers == currentThreshold and \
		BaseValues.multiThreshold[currentThresholdIndex] == currentThreshold:
		currentThresholdIndex += 1
		currentThreshold = BaseValues.multiThreshold[currentThresholdIndex]
	$Label.text = "Click For +" + str(CalcPoints()) + " Point(s)\n" +\
		"Level: " + str(Persist.ownedClickers)

func OnClick():
	Persist.currentPoints += CalcPoints()

func CalcPoints():
	return Persist.ownedClickers * pow(2, currentThresholdIndex)
