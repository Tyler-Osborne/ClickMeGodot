extends RichTextLabel

func _process(_delta):
	if (!visible and Persist.ownedAutos > 0):
		visible = true

	if visible:
		var pps : int = 0
		var autoClicks =  get_node("/root/Game/UI/AutoClickColumn").get_children()
		for ac in autoClicks:
			pps += ac.CalcPoints()

		bbcode_text = "[center]Pts/S: " + str(round(pps)) + "[center]"
