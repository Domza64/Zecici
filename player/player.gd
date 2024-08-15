extends CharacterBody2D

const BASE_SPEED = 300.0
const JUMP_VELOCITY = -1200.0
const MAX_SPEED_MODIFIER = 5.0  # Maximum speed multiplier
const SPEED_INCREMENT = 2.5  # Speed multiplier increase per second
const SPEED_DECREMENT = 10.0  # Speed multiplier decrease per second
const DEFAULT_SKIN = "steve"

@onready var player = $".."
@onready var playerNum = player.get_meta("playerNum")
@onready var skin = player.get_meta("skin")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var speed_modifier = 1.0  # Initial speed multiplier

# Mapping player numbers to input actions
var input_map = {
	1: {
		"jump": "jump_p1",
		"left": "left_p1",
		"right": "right_p1"
	},
	2: {
		"jump": "jump_p2",
		"left": "left_p2",
		"right": "right_p2"
	}
}

func _ready():
	if playerNum == null:
		push_error("Metadata 'playerNum' must be set for Player instance: " + self.to_string() + "!")
	if skin == null:
		skin = DEFAULT_SKIN
		
	var skin = load("res://player/player_skin_" + skin + ".tscn").instantiate()
	add_child(skin)

func _physics_process(delta):
	handle_gravity(delta)
	handle_movement(delta)
	handle_jump()

func handle_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_movement(delta):
	var input_actions = input_map.get(playerNum)
	if input_actions:
		var direction = Input.get_axis(input_actions["left"], input_actions["right"])
		if direction != 0:
			# Increase speed modifier when moving
			speed_modifier = min(speed_modifier + SPEED_INCREMENT * delta, MAX_SPEED_MODIFIER)
			velocity.x = direction * BASE_SPEED * speed_modifier
		else:
			# Reset speed modifier when not moving
			speed_modifier = max(speed_modifier - SPEED_DECREMENT * delta, 1.0)
			velocity.x = move_toward(velocity.x, 0, BASE_SPEED * speed_modifier)

func handle_jump():
	var input_actions = input_map.get(playerNum)
	if input_actions and Input.is_action_just_pressed(input_actions["jump"]) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()
