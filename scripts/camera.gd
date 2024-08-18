extends Camera2D

const MOVE_SPEED = 1

func _process(delta):
	position.y -= MOVE_SPEED * delta
