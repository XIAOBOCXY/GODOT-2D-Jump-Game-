extends Area2D


@onready var timer = $Timer
signal isdied
func _on_body_entered(body):
	print("you died!")
	emit_signal("isdied")
	Engine.time_scale = 0.5 
	body.get_node("CollisionShape2D").queue_free()
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
