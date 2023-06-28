extends Node

var max_speed = 60
var in_dialogue = false

var desempenho_academico = 0
var saude_mental = 100
var saude_fisica = 100
var social = 100

var dia = 1
var hora = 7

var materias = 5

var has_classes = true
var has_eaten = false
var cafe_da_manha = false
var almoco = false
var jantar = false

func checkup():
	if saude_mental < 0:
		end_game()
	elif saude_fisica < 0:
		end_game()
	elif social < 0:
		end_game()

func end_day():
	if has_classes:
		skipped_class()
	if !(has_eaten):
		skipped_food()
	
	checkup()

	dia += 1
	hora = 7
	has_classes = true
	has_eaten = false
	cafe_da_manha = false
	almoco = false
	jantar = false
	
	if dia == 6:
		end_game()
		
	

func end_game():
	if saude_mental < 0:
		end_game()
	elif saude_fisica < 0:
		end_game()
	elif social < 0:
		end_game()

func skipped_class():
	pass
	
func skipped_food():
	pass
