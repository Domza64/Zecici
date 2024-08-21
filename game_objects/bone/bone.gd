extends Area2D


func _on_body_entered(body):
	if body is CharacterBody2D:
		body.changeSkin("strawberry")
		queue_free()
