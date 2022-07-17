extends "res://Prototypes/Characters/PlayerBase.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	input = get_player_input(input)
	set_velocity(input)
	
	adjust_flip_direction(input)
	set_anim_parameters()
	
	move(velocity)
	
	pick_next_state()
