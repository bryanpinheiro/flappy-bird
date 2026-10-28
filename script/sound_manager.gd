extends Node

@onready var music_player: AudioStreamPlayer = %MusicPlayer
@onready var sfx_player_1: AudioStreamPlayer = %SFXPlayer1
@onready var sfx_player_2: AudioStreamPlayer = %SFXPlayer2

@onready var sfx_players: Array[AudioStreamPlayer] = [sfx_player_1, sfx_player_2]
var current_sfx: int = 0

func _ready() -> void:
	EventBus.audio_player_jumped.connect(func(): play_sfx("res://asset/dragonflap.mp3"))
	EventBus.audio_player_collided.connect(func(): 
		play_sfx("res://asset/thunk.wav")
	)
	EventBus.audio_button_hovered.connect(func(): play_sfx("res://asset/button.wav"))

	EventBus.play_main_music.connect(func(): play_music("res://asset/wave-sounds.mp3"))
	EventBus.stop_main_music.connect(stop_music)
	EventBus.restart_main_music.connect(func(): restart_music("res://asset/wave-sounds.mp3"))


func play_music(path: String) -> void:
	if music_player.playing and music_player.stream and music_player.stream.resource_path == path:
		return
		
	var stream = load(path)
	if stream:
		if stream is AudioStreamMP3 or stream is AudioStreamOggVorbis:
			stream.loop = true
		music_player.stream = stream
		music_player.play()


func restart_music(path: String) -> void:
	var stream = load(path)
	if stream:
		if stream is AudioStreamMP3 or stream is AudioStreamOggVorbis:
			stream.loop = true
		music_player.stream = stream
		music_player.play(0.0)


func stop_music() -> void:
	if music_player.playing:
		music_player.stop()


func play_sfx(path: String) -> void:
	var stream = load(path)
	if stream:
		var player = sfx_players[current_sfx]
		player.stream = stream
		player.play()
		current_sfx = (current_sfx + 1) % sfx_players.size()
		
		
