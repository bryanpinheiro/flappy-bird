extends Control

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_fullscreen_pressed() -> void:
	get_window().mode = Window.MODE_FULLSCREEN
	#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_play_mouse_entered() -> void:
	audio_stream_player.play()


func _on_fullscreen_mouse_entered() -> void:
	audio_stream_player.play()
