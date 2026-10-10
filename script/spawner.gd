extends Marker2D

const OBSTACLE = preload("uid://mtkiq18r1rew")


func _on_timer_timeout():
	var random_y = randi_range(-100, 100)
	var obstacle: Node2D = OBSTACLE.instantiate()
	obstacle.position.y = random_y
	add_child(obstacle)
