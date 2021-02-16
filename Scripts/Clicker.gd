extends TextureButton

var currentPoints : int = 0
var initialClickAmount : int = 1
export var clickAmount : int

func _ready():
	# load settings from save file maybe?
	clickAmount = initialClickAmount
	$Label.text = "Click For +" + str(clickAmount) + " Point(s)"

func OnClick():
	currentPoints += clickAmount