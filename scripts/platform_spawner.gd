extends Node2D

const WIDTH = 455;

@onready var timer = get_node("Timer")
@onready var initialHeight = position.x

func _ready():
	timer.set_wait_time(3)
	timer.start()

func _on_timer_timeout():
	var platform = load("res://game_objects/platform.tscn").instantiate()
	var platformX = randi_range(-WIDTH, WIDTH)
	platform.position = Vector2(platformX, -initialHeight)
	initialHeight += 40
	add_child(platform)
	
	var randNum = randi_range(1, 5)
	if (randNum == 1):
		var strawberry = load("res://game_objects/strawberry/strawberry.tscn").instantiate()
		strawberry.position.y -= 15
		platform.add_child(strawberry)
	else: if (randNum == 5):
		var coin = load("res://game_objects/coin/coin.tscn").instantiate()
		coin.position.y -= 15
		platform.add_child(coin)
	else: if (randNum == 3):
		var bone = load("res://game_objects/bone/bone.tscn").instantiate()
		bone.position.y -= 15
		platform.add_child(bone)
		
	
