extends GridContainer

onready var VirtualGuyDialog = $ViewportContainer/Viewport/Map/VirtualGuy/Dialog

func _ready():
	for i in get_child_count():
		get_child(i).player_id = i+1

func _input(event):
	if VirtualGuyDialog.dialog_activate:
		add_child(VirtualGuyDialog.dialog)

