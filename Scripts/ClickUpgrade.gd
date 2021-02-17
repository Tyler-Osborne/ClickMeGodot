extends TextureButton

onready var game = get_node("/root/Game")
var baseCost = 10
var currentLevel : int

func _ready():
	# load settings from save file maybe?
	$Label.text = "Upgrade Cost: " + str(CalculateCost())

func _process(_delta):
	$Label.text = "Upgrade Cost: " + str(CalculateCost())

func OnClick():
	if (game.currentPoints >= CalculateCost()):
		Upgrade()

func Upgrade():
	game.currentPoints -= CalculateCost()
	BaseValues.ownedClickers += 1


func CalculateCost():
	if (BaseValues.ownedClickers == 1):
		return 10

	return ceil(baseCost * pow(BaseValues.MULTIPLIER, BaseValues.ownedClickers))
