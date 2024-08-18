extends Area2D

func _on_body_entered(body):
	if body is CharacterBody2D:
		GameManager.killPlayer(body.playerNumber)
	else:
		queue_free()
