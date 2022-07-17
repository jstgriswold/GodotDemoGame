extends Control

export var PlayerViewport: PackedScene

onready var PlayerWindow = $PlayerWindow
onready var current_players:int = GameState.number_players

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerWindow.columns = current_players
	for player in range(current_players):
#		Add a viewport for each player
		PlayerWindow.add_child(PlayerViewport.instance())
		
#		Set the player id for each player window
		PlayerWindow.get_child(player).player_id = player+1
		print("Player %s loaded" % [PlayerWindow.get_child(player).player_id])
