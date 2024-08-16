extends Area2D


func _on_body_entered(body):
	print("strawberry")
	queue_free()
