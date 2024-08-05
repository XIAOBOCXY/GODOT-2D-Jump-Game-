extends Area2D

signal InSavePoint


func _on_body_entered(body):
	print(body.name)
	if body.name == "Player":
		print("player in savepoint")
		emit_signal("InSavePoint")
	pass # Replace with function body.




