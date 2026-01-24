extends Control

@onready var nextScene = preload("res://seashore-gameoff/scenes/shore.tscn")
@onready var buttons:=%MenuButtons
var tween
func _ready() -> void:
	tween=get_tree().create_tween()
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(buttons,"position:x",960.0,1)

func _on_play_button_pressed() -> void:
	SceneManager.nextScene(0)

func _on_credits_button_pressed() -> void:
	%"Credits Panel".visible = true
	%"Credits Panel".modulate = Color(1,1,1,0)
	transitionPanel(%"Credits Panel",Color.WHITE)

func _on_quit_button_pressed() -> void:
	get_tree().quit()

#loops music
func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()

func _on_close_credits_pressed():
	transitionPanel(%"Credits Panel",Color.TRANSPARENT)
	await tween.finished
	%"Credits Panel".visible = false

func _on_tutorial_button_pressed():
	%"Tutorial Panel".visible = true
	%"Tutorial Panel".modulate = Color(1,1,1,0)
	transitionPanel(%"Tutorial Panel",Color.WHITE)

func _on_close_tutorial_pressed():
	transitionPanel(%"Tutorial Panel",Color.TRANSPARENT)
	await tween.finished
	%"Tutorial Panel".visible = false
	


func transitionPanel(n:Object,c:Color):
	if tween is Tween:
		tween.kill()
	tween=get_tree().create_tween()
	tween.tween_property(n,"modulate",c,0.25)
