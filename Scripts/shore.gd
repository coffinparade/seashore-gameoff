extends Node2D

@export var wave_time :=2.0
var last_detect_time:float
@onready var wave_anim = $AnimationPlayer
func _on_stand_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.store_shells()
func _process(delta: float) -> void:
	var time = Time.get_unix_time_from_system()
	if time-last_detect_time>wave_time:
		last_detect_time = time
		_clear_shore()
func _clear_shore():
	wave_anim.current_animation = "wave"
	pass
func _spawn_shore():
	pass
