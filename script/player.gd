extends CharacterBody2D

signal died
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var alive: bool = true

func _ready() -> void:
	animated_sprite.play("default")

func _physics_process(delta):
	velocity.y += get_gravity().y * 0.05
	
	#player can jump because he is alive.
	if alive == true:
		if Input.is_action_just_pressed("jump"):
			EventBus.audio_player_jumped.emit()
			velocity.y = -1000	* 0.6
			animation_player.play("fly_up")
			
	move_and_slide()
	
	if not animation_player.is_playing() and velocity.y > 0:
		$AnimatedSprite2D.rotation = lerp_angle($AnimatedSprite2D.rotation, deg_to_rad(45), delta * 5)
	
	#player collided
	if get_last_slide_collision() != null:
		game_over()


func _on_screen_exited():
	game_over()


func game_over() -> void:
	if alive == true:
		EventBus.audio_player_collided.emit()
		animated_sprite.pause()
		animation_player.stop()
		died.emit()
	alive = false
	
