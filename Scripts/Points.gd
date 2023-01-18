extends RichTextLabel

func _process(_delta):
	text = "[center]Points: " + str(round(Persist.currentPoints)) + "[center]"
