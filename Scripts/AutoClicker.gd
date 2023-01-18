extends TextureButton

class_name AutoClicker
var index : int
var baseCost : int
var cps : int
var currentThreshold: int
var currentThresholdIndex: int

func _ready():
	# Compose AutoClicker
	currentThresholdIndex = 0
	currentThreshold = BaseValues.multiThreshold[currentThresholdIndex]
	index = Persist.ownedAutos
	baseCost = AutoData.AutoClickData[index].BaseCost
	cps = AutoData.AutoClickData[index].CPS
	Persist.ownedAutos += 1
	$Label.text = "Purchase Cost: " + str(CalculateCost())

func _process(delta):
	if AutoData.AutoClickData[index].Amount == currentThreshold and \
		BaseValues.multiThreshold[currentThresholdIndex] == currentThreshold:
		currentThresholdIndex += 1
		currentThreshold = BaseValues.multiThreshold[currentThresholdIndex]
	if (Persist.ownedAutos > 0):
		$Label.text = str(CalcPoints()) + " Points/s\n" + \
			"Upgrade Cost: " + str(CalculateCost())
		$Level.text = "Level: " + str(AutoData.AutoClickData[index].Amount)
		Persist.currentPoints += CalcPoints() * delta

func OnClick():
	if (Persist.currentPoints >= CalculateCost()):
		Upgrade()

func Upgrade():
	Persist.currentPoints -= CalculateCost()
	AutoData.AutoClickData[index].Amount += 1


func CalculateCost():
	if (AutoData.AutoClickData[index].Amount == 0):
		return baseCost
	
	var metThresh = 0
	var costMulti = 1
	
	for thresh in BaseValues.multiThreshold:
		if (Persist.ownedClickers >= thresh):
			metThresh += 1
			costMulti = pow(2, metThresh)
		else:
			break
	
	return ceil((baseCost * pow(BaseValues.MULTIPLIER, AutoData.AutoClickData[index].Amount)) / costMulti)

func CalcPoints():
	return cps * AutoData.AutoClickData[index].Amount * pow(2, currentThresholdIndex)