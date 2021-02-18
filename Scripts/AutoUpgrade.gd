extends TextureButton

# onready var game = get_node("/root/Game")
var baseCost = 50
var currentLevel : int

func _ready():
	# load settings from save file maybe?
	$Label.text = "Purchase Cost: " + str(CalculateCost())

func _process(_delta):
	if (Persist.ownedAutos > 0):
		$Label.text = str(Persist.ownedAutos) + " Points/s\n" + \
			"Upgrade Cost: " + str(CalculateCost())

func OnClick():
	if (Persist.currentPoints >= CalculateCost()):
		Upgrade()

func Upgrade():
	Persist.currentPoints -= CalculateCost()
	Persist.ownedAutos += 1


func CalculateCost():
	if (Persist.ownedAutos == 0):
		return baseCost

	return ceil(baseCost * pow(BaseValues.MULTIPLIER, Persist.ownedAutos))

func _on_Timer_timeout():
	Persist.currentPoints += Persist.ownedAutos
