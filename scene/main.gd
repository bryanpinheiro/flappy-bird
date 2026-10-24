extends Node2D

var score: int = 0

@onready var score_label = %ScoreLabel

func _ready() -> void:
	EventBus.scored.connect(_on_scored)
	score_label.text = str("[wave]", score)
	
	
func _on_scored() -> void:
	score += 1
	score_label.text = str("[wave]", score)


func _on_player_died() -> void:
	EventBus.game_finished.emit(score, -1)
