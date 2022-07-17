extends Node2D

export var mainGameScene: PackedScene

func _on_1PNewGame_button_up():
	GameState.number_players = 1
	get_tree().change_scene(mainGameScene.resource_path)


func _on_2PNewGame_button_up():
	GameState.number_players = 2
	get_tree().change_scene(mainGameScene.resource_path)


func _on_QuitBtn_button_up():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
