extends StaticBody2D

@export var speed : float = 400

const OBSTACLE = preload("uid://mtkiq18r1rew")


func _physics_process(delta):
	position.x -= speed * delta


func _on_score_area_body_entered(body):
	EventBus.scored.emit()
