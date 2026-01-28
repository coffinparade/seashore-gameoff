extends Sprite2D
@warning_ignore("shadowed_variable_base_class")
func _on_animation_player_current_animation_changed(name: String) -> void:
	if name == "wave_up":
		position.x = randi_range(-700,700)
