extends Node2D

var tv = false
var door = false
var bed = false
var pc = false
var fridge = false

func _ready():
	print(Global.in_dialogue)
	DialogueManager.show_example_dialogue_balloon(load("res://Dialogs/tutorial.dialogue"), "main")
	print(Global.in_dialogue)
	
func _process(_delta):
	var interact = Input.is_action_just_pressed("ui_interact")
	
	if tv and interact and !(Global.in_dialogue):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogs/tv.dialogue"), "main")
	
	if door and interact and !(Global.in_dialogue):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogs/door.dialogue"), "main")
		
	if bed and interact and !(Global.in_dialogue):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogs/bed.dialogue"), "main")
		
	if pc and interact and !(Global.in_dialogue):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogs/pc.dialogue"), "main")
		
	if fridge and interact and !(Global.in_dialogue):
		DialogueManager.show_example_dialogue_balloon(load("res://Dialogs/fridge.dialogue"), "main")
		


func _on_tv_body_entered(body):
	if body == $Player:
		tv = true

func _on_tv_body_exited(body):
	if body == $Player:
		tv = false

func _on_door_body_entered(body):
	if body == $Player:
		door = true

func _on_door_body_exited(body):
	if body == $Player:
		door = false

func _on_bed_body_entered(body):
	if body == $Player:
		bed = true

func _on_bed_body_exited(body):
	if body == $Player:
		bed = false

func _on_pc_body_entered(body):
	if body == $Player:
		pc = true

func _on_pc_body_exited(body):
	if body == $Player:
		pc = false

func _on_fridge_body_entered(body):
	if body == $Player:
		fridge = true

func _on_fridge_body_exited(body):
	if body == $Player:
		fridge = false
