extends ViewportContainer

onready var Map = $Viewport/Map/GroundMap
onready var map_limits = Map.get_used_rect()
onready var map_cellsize = Map.cell_size

var player_id: int setget update_camera

func _ready():
	set_camera_limits()

func update_camera(id):
#	var target_id
#	print("player %s camera set" % [id])
	match id:
		1:
			$Viewport/Camera2D.target = $Viewport/Map/Player1Node/PinkMan
		2:
			$Viewport/Camera2D.target = $Viewport/Map/Player2Node/MaskDude

func set_camera_limits():
	$Viewport/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Viewport/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Viewport/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Viewport/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
