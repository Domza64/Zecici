extends ParallaxBackground

@export var scroll_speed := 100.0  # pixels per second

func _process(delta):
	scroll_offset.y -= scroll_speed * delta
