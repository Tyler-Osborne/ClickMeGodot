extends RichTextLabel

func _process(_delta):
	bbcode_text = "[center]Points: " + str(round(Persist.currentPoints)) + "[center]"