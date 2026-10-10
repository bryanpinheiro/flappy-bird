extends CharacterBody2D


func _physics_process(delta):
	velocity.y += get_gravity().y * 0.05
	if Input.is_action_just_pressed("jump"):
		velocity.y = -1000	* 0.6
	move_and_slide()
	
	if get_last_slide_collision() != null:
		get_tree().reload_current_scene() # TODO: trocar por tela de game over


func _on_screen_exited():
	get_tree().reload_current_scene()
