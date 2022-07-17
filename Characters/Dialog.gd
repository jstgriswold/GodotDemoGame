extends Area2D

var talkOK: bool = false
#var talkActive: bool = GameState.talk_active
var dialog_activate = false
var resource = preload("res://dialogue/dialogue1.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_NPC_body_entered")
	connect("body_exited", self, "_on_NPC_body_exited")

func _process(delta):
	$TalkLabel.visible = talkOK

func _input(event):
	if !GameState.talk_active:
		if event.is_action_pressed("ui_accept") and talkOK:
			GameState.talk_active = true
			DialogueManager.show_example_dialogue_balloon(\
				"main_dialog", \
				resource
		)

#func _input(event):
#	if get_node_or_null("DialogNode") == null:
#		if event.is_action_pressed("ui_accept") and talkOK:
#			get_tree().paused = true
#			var use_canvas_instead = false
#			var dialog = Dialogic.start("conversation")
#			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
#			dialog.connect("timeline_end", self, "unpause")
#			dialog_activate = true
##			add_child(dialog)
#
#func unpause(timeline_name):
#	get_tree().paused = false
#	talkOK = false

func _on_NPC_body_entered(body):
	if body.name == "PinkMan" || body.name == "MaskDude":
		talkOK = true

func _on_NPC_body_exited(body):
	if body.name == "PinkMan" || body.name == "MaskDude":
		talkOK = false
