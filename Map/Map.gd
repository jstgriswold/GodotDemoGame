extends Node2D

export var PinkMan: PackedScene
export var MaskDude: PackedScene
export var VirtualGuy: PackedScene

func _ready():
	var VirtualGuyNode = $VirtualGuyNode
	VirtualGuyNode.add_child(VirtualGuy.instance())
	if GameState.number_players == 1:
		var Player1Node = $Player1Node
		Player1Node.add_child(PinkMan.instance())
	if GameState.number_players == 2:
		var Player1Node = $Player1Node
		var Player2Node = $Player2Node
		Player1Node.add_child(PinkMan.instance())
		Player2Node.add_child(MaskDude.instance())
