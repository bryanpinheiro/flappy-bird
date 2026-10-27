extends Control

@onready var stats: RichTextLabel = %Stats
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

func _ready() -> void:
	hide()
	EventBus.game_finished.connect(_on_game_finished)
	

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
	
	
func _on_game_finished(score: int, max_score: int) -> void:
	stats.text = str("Pontuação: ", score, "\nRecorde: ", max_score)
	show()


func _on_restart_mouse_entered() -> void:
	audio_stream_player.play()


func _on_menu_mouse_entered() -> void:
	audio_stream_player.play()
