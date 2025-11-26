extends Control

@onready var nextScene = preload("res://seashore-gameoff/scenes/shore.tscn")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(nextScene)

func _on_credits_button_pressed() -> void:
	%"Credits Panel".visible = true
	

func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()


func _on_close_credits_pressed():
	%"Credits Panel".visible = false
