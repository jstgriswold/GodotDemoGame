extends "res://Prototypes/Characters/CharacterBase.gd"

export(int) var player_id: int

onready var animation_tree = $AnimationTree
onready var animated_sprite = $AnimatedSprite

var input: Vector2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_player_input(input):
	input.x = Input.get_action_strength("right_%sP" % [player_id]) \
		- Input.get_action_strength("left_%sP" % [player_id])
	input.y = Input.get_action_strength("down_%sP" % [player_id]) \
		- Input.get_action_strength("up_%sP" % [player_id])
	
	return input

func set_velocity(input):
	velocity = Vector2(
		input.x * move_speed,
		input.y * move_speed
	)

func set_anim_parameters():
	animation_tree.set("parameters/x_move/blend_position", \
		sign(velocity.x))

func adjust_flip_direction(input: Vector2):
	if sign(input.x) == 1:
		animated_sprite.flip_h = false
	elif sign(input.x) == -1:
		animated_sprite.flip_h = true
