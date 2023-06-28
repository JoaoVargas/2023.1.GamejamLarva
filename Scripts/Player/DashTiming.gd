extends Timer

signal time(timeleft)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	time.emit(time_left)

func _on_player_start_dash_timing():
	start()
