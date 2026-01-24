extends Control

@onready var panel = $MarginContainer/Panel
#gets the journal text and adds it to the label
func _ready():
	$MarginContainer/Panel/Label.text = SceneManager.journalText()
	var timer=get_tree().create_timer(3)
	timer.timeout.connect(fadeButton)

#fades in the text
func _process(delta):
	panel.modulate = Color(lerp(panel.modulate,Color("ffffffff"),1*delta))


func _on_button_pressed():
	SceneManager.nextScene(1)

#loops music
func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()

func fadeButton():
	var tween = get_tree().create_tween()
	tween.tween_property($MarginContainer/Panel/Button,"modulate",Color.WHITE,1)
	
