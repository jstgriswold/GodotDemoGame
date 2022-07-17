extends KinematicBody2D

export(float) var move_speed = 200
var velocity = Vector2.ZERO

enum STATE { IDLE, RUN }
var current_state = STATE.IDLE setget set_current_state
signal changed_state(new_state_string, new_state_id)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func move(velocity):
	if !GameState.talk_active:
		velocity = move_and_slide(velocity)


func pick_next_state():
	if(abs(velocity.x) > 0 || abs(velocity.y) > 0):
		self.current_state = STATE.RUN
	else:
		self.current_state = STATE.IDLE


# SETTERS
func set_current_state(new_state):
	
	current_state = new_state
	emit_signal("changed_state", STATE.keys()[new_state], new_state)
