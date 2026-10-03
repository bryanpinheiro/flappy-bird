extends Marker2D

const OBSTACLE = preload("uid://mtkiq18r1rew")


func _on_timer_timeout():
	var obstacle: Node2D = OBSTACLE.instantiate()
	add_child(obstacle)
