extends StaticBody2D

@export var speed : float = 200

func _physics_process(delta):
	position.x -= speed * delta
