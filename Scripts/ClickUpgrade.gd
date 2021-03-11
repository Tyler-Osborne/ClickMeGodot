extends TextureButton

# onready var game = get_node("/root/Game")
var baseCost = 10
var currentLevel : int

func _ready():
	# load settings from save file maybe?
	$Label.text = "Upgrade Cost: " + str(CalculateCost())

func _process(_delta):
	$Label.text = "Upgrade Cost: " + str(CalculateCost())

func OnClick():
	if (Persist.currentPoints >= CalculateCost()):
		Upgrade()

func Upgrade():
	Persist.currentPoints -= CalculateCost()
	Persist.ownedClickers += 1


func CalculateCost():	
	if (Persist.ownedClickers == 1):
		return baseCost
	
	var metThresh = 0
	var costMulti = 1

	for thresh in BaseValues.multiThreshold:
		if (Persist.ownedClickers >= thresh):
			metThresh += 1
			costMulti = pow(2, metThresh)
		else:
			break

	return ceil((baseCost * pow(BaseValues.MULTIPLIER, Persist.ownedClickers) / costMulti))
