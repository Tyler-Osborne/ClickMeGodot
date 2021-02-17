extends TextureButton

onready var game = get_node("/root/Game")
var baseCost = 100
var currentLevel : int

func _ready():
	# load settings from save file maybe?
	$Label.text = "Purchase Cost: " + str(CalculateCost())

func _process(_delta):
	if (BaseValues.ownedAutos > 0):
		$Label.text = str(BaseValues.ownedAutos) + " Points/s\n" + \
			"Upgrade Cost: " + str(CalculateCost())

func OnClick():
	if (game.currentPoints >= CalculateCost()):
		Upgrade()

func Upgrade():
	game.currentPoints -= CalculateCost()
	BaseValues.ownedAutos += 1


func CalculateCost():
	if (BaseValues.ownedAutos == 0):
		return 100

	return ceil(baseCost * pow(BaseValues.MULTIPLIER, BaseValues.ownedAutos))

func _on_Timer_timeout():
	game.currentPoints += BaseValues.ownedAutos