extends Camera2D

const MOVE_SPEED = 4

func _process(delta):
	position.y -= MOVE_SPEED * delta
