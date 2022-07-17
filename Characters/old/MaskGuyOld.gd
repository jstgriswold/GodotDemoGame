extends KinematicBody2D

export(float) var move_speed = 200
export(int) var player_id = 2

enum STATE { IDLE, RUN }

#onready var animated_sprite = $AnimatedSprite
#onready var animation_tree = $AnimationTree

signal changed_state(new_state_string, new_state_id)

var velocity : Vector2

var current_state = STATE.IDLE setget set_current_state

func _physics_process(delta):
	var input = get_player_input()
#	adjust_flip_direction(input)
	
	velocity = Vector2(
		input.x * move_speed,
		input.y * move_speed
	)
	
	velocity = move_and_slide(velocity)
	
#	set_anim_parameters()
	
	pick_next_state()

#func adjust_flip_direction(input: Vector2):
#	if(sign(input.x) == 1):
#		animated_sprite.flip_h = false
#	elif(sign(input.x) == -1):
#		animated_sprite.flip_h = true

#func set_anim_parameters():
#	animation_tree.set("parameters/x_sign/blend_position", sign(velocity.x))
#	animation_tree.set("parameters/y_sign/blend_amount", sign(velocity.y))

func pick_next_state():
	if(abs(velocity.x) > 0 || abs(velocity.y) > 0):
		self.current_state = STATE.RUN
	else:
		self.current_state = STATE.IDLE

func get_player_input():
	var input : Vector2
	
	input.x = Input.get_action_strength("right_2P") - Input.get_action_strength("left_2P")
	input.y = Input.get_action_strength("down_2P") - Input.get_action_strength("up_2P")
	
	return input

# SETTERS
func set_current_state(new_state):
	
	current_state = new_state
	emit_signal("changed_state", STATE.keys()[new_state], new_state)
