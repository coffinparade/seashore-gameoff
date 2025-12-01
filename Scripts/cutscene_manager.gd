extends Control

func _ready():
	$MarginContainer/Panel/Label.text = SceneManager.journalText()

func _process(delta):
	$MarginContainer/Panel.modulate = Color(lerp($MarginContainer/Panel.modulate,Color("ffffffff"),1*delta))


func _on_button_pressed():
	SceneManager.nextScene(1)


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
