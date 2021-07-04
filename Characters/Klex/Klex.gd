extends KinematicBody2D

const UP = Vector2(0, -1)

var motion = Vector2.ZERO

var DEFAULT_GRAVITY = 50
var gravity = DEFAULT_GRAVITY
var speed = 500
var speed_multiplier = 1

var jump_speed = 1000
var hurt_speed = 500
var climb_speed = 250

var on_ladder = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	apply_gravity()
	move()
	jump()
	climb()
	turn_on_light()



func _ready():
	connect_signals()


func connect_signals():
	Gamestate.connect("player_dead", self, "die")
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	for enemy in enemies:
		enemy.connect("hit", self, "collide_with_enemy")
		enemy.connect("poisioned", self, "poisioned")


func show_riddle():
	$UI/Riddle.visible = true


func turn_on_light():
	if Input.is_action_just_pressed("light") && Gamestate.has_screen:
		$ScreenLight.visible = !$ScreenLight.visible


func collide_with_enemy():
	position.y -= 1 # move off floor 
	yield(get_tree(), "idle_frame") # bypass gravity by skipping next frame
	$AnimationPlayer.play("hurt")
	$HurtSound.play()


func move():
	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = -speed * speed_multiplier
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
		
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = speed * speed_multiplier
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("move_up") and on_ladder:
		$AnimatedSprite.play("climb")
	
	elif Input.is_action_pressed("move_down") and on_ladder:
		$AnimatedSprite.play("climb")
	
	else:
		motion.x = 0
		$AnimatedSprite.play("idle")
		
	move_and_slide(motion, UP)



func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		$AnimatedSprite.play("jump")
		motion.y -= jump_speed
		$JumpSound.play()


func stomp_bounce():
	$AnimatedSprite.play("jump")
	motion.y = -500
	$JumpSound.play()


func poisoned():
	speed_multiplier = 0.2
	Gamestate.battery_life -= 15
	$AnimationPlayer.play("poisoned")
	$PoisonTimer.start()
	$HurtSound.play()


func die():
	Gamestate.battery_life = 0
	yield(get_tree(), "idle_frame")
	get_tree().paused = true


func climb():
	if on_ladder:
		gravity = 0
		
		if Input.is_action_pressed("move_up"):
			motion.y = -climb_speed
		elif Input.is_action_pressed("move_down"):
			motion.y = climb_speed
		else:
			motion.y = 0
	else:
		gravity = DEFAULT_GRAVITY


func apply_gravity():
	if position.y > Gamestate.world_limit:
		Gamestate.restart_level()
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += gravity


func _on_PoisonTimer_timeout():
	speed_multiplier = 1
	$AnimatedSprite.self_modulate = Color.white
