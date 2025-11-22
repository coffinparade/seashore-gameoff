extends Area2D
class_name Creature
#TODO:
#- make it so the player gets hit when in contact with creature


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.hit()
