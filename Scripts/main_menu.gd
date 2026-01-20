extends Control

@onready var nextScene = preload("res://seashore-gameoff/scenes/shore.tscn")

#TODO: make the buttons slide in from the side of the screen

func _on_play_button_pressed() -> void:
	SceneManager.nextScene(0)

#TODO:make credits fade in
func _on_credits_button_pressed() -> void:
	%"Credits Panel".visible = true


func _on_quit_button_pressed() -> void:
	get_tree().quit()

#loops music
func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()

#TODO: make credits fade out
func _on_close_credits_pressed():
	%"Credits Panel".visible = false

#TODO: make tutorial fade in
func _on_tutorial_button_pressed():
	%"Tutorial Panel".visible = true

#TODO: make tutorial fade out
func _on_close_tutorial_pressed():
	%"Tutorial Panel".visible = false
	
