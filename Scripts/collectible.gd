extends Area2D
class_name CollectibleShell
@export var type:Shell

func set_texture():
		$Sprite2D.texture = type.texture

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.add_shell(type)
		body.print_shells()
		queue_free()
