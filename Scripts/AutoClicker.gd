extends TextureButton

# onready var game = get_node("/root/Game")
var index : int
var baseCost : int
var cps : int


func _ready():
	# Compose AutoClicker
	index = Persist.ownedAutos
	baseCost = AutoData.AutoClickData[index].BaseCost
	cps = AutoData.AutoClickData[index].CPS
	Persist.ownedAutos += 1
	$Label.text = "Purchase Cost: " + str(CalculateCost())

func _process(_delta):
	if (Persist.ownedAutos > 0):
		$Label.text = str(AutoData.AutoClickData[index].Amount * cps) + " Points/s\n" + \
			"Upgrade Cost: " + str(CalculateCost())

func OnClick():
	if (Persist.currentPoints >= CalculateCost()):
		Upgrade()

func Upgrade():
	Persist.currentPoints -= CalculateCost()
	AutoData.AutoClickData[index].Amount += 1


func CalculateCost():
	if (AutoData.AutoClickData[index].Amount == 0):
		return baseCost

	return round(baseCost * pow(BaseValues.MULTIPLIER, AutoData.AutoClickData[index].Amount))

func _on_Timer_timeout():
	Persist.currentPoints += cps * AutoData.AutoClickData[index].Amount
