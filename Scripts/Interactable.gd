extends Area2D


func _process(_delta):
	pass

func _on_body_entered(body):
	if body == $"../Player":
		$AnimatedSprite2D.play("default")

func _on_body_exited(body):
	if body == $"../Player":
		$AnimatedSprite2D.stop()
