extends Label

func _process(_delta):
	text = "%01dh00 do dia %01d" % [Global.hora,Global.dia]
