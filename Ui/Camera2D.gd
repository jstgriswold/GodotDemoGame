extends Camera2D

var target

func _process(_delta):
	if target == null:
		return
	position = target.position
