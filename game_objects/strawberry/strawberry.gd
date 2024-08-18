extends Area2D


func _on_body_entered(body):
	body.changeSkin("strawberry")
	queue_free()
