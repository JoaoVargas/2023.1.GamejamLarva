extends CharacterBody2D
class_name Player

signal start_dash_timer
signal start_dash_timing

var dash_ready = false
var dashing = false
const dash_strenght = 400
var tl = 0

var player_direction = -1

#var max_speed = Global.max_speed
const accel = 500
const friction = 500

var input = Vector2.ZERO

func _physics_process(delta):
	player_movement(delta)

func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()

func player_movement(delta):
	input = get_input()
	
	run_animation(input)
	idle_animation(input)
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		if Input.is_action_pressed("ui_space") and dash_ready and !dashing:
			dash_ready = false
			dashing = true
			start_dash_timing.emit()
		else:
			velocity += (input * accel * delta * (1 + (dash_strenght * tl)) + (input * 100))
			velocity = velocity.limit_length(Global.max_speed + (dash_strenght * tl))
	
	
	
	move_and_slide()
	
func run_animation(input_):
	var anim = $AnimatedSprite2D
	
	if input_.y > 0:
		anim.play("run_down")
	elif input_.y < 0:
		anim.play("run_up")
	elif input_.x > 0:
		anim.play("run_right")
	elif input_.x < 0:
		anim.play("run_left")

func idle_animation(input_):
	var anim = $AnimatedSprite2D

	if !(input_ == Vector2.ZERO):
		if Input.is_action_pressed("ui_down"):
			player_direction = -1
		elif Input.is_action_pressed("ui_up"):
			player_direction = 1
		elif Input.is_action_pressed("ui_left"):
			player_direction = -2
		elif Input.is_action_pressed("ui_right"):
			player_direction = 2

	if input_ == Vector2.ZERO:
		if player_direction == -1:
			anim.play("idle_down")
		elif player_direction == 1:
			anim.play("idle_up")
		elif player_direction == -2:
			anim.play("idle_left")
		elif player_direction == 2:
			anim.play("idle_right")

func _on_dash_timer_timeout():
	dash_ready = true

func _on_dash_timing_timeout():
	dashing = false
	#velocity += (input * accel * delta)
	#velocity = velocity.limit_length(max_speed)
	
	start_dash_timer.emit()

func _on_dash_timing_time(timeleft):
	tl = timeleft

func _on_detection_area_body_entered(body):
	if body.has_method("npc"):
		print("NPC")

func _on_detection_area_body_exited(_body):
	print("saiu")
