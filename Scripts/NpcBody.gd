extends CharacterBody2D


func _ready():
	var anim = $AnimatedSprite2D
	anim.play("idle_down")
	
func npc():
	pass
