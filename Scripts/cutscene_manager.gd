extends Control

#gets the journal text and adds it to the label
func _ready():
	$MarginContainer/Panel/Label.text = SceneManager.journalText()

#fades in the text
#TODO: make the button fade in after a few seconds to make sure the player reads the text and make this a tween
func _process(delta):
	$MarginContainer/Panel.modulate = Color(lerp($MarginContainer/Panel.modulate,Color("ffffffff"),1*delta))


func _on_button_pressed():
	SceneManager.nextScene(1)

#loops music
func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
