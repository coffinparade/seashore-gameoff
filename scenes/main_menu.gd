extends Control

@onready var nextScene = preload("res://seashore-gameoff/scenes/shore.tscn")

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_packed(nextScene)

func _on_credits_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_button_pressed() -> void:
	get_tree().quit()
