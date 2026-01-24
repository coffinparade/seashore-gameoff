extends Area2D
class_name Creature

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hit(position)
