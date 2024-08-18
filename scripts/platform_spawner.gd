extends Node2D

const WIDTH = 455;

@onready var timer = get_node("Timer")
@onready var height = position.x

func _ready():
	timer.set_wait_time(2)
	timer.start()

func _on_timer_timeout():
	var platform = load("res://game_objects/platform.tscn").instantiate()
	var platformX = randi_range(-WIDTH, WIDTH)
	platform.position = Vector2(platformX, -height)
	height += 50
	add_child(platform)
