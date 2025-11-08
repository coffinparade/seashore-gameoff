extends Area2D

@export var value:=1
@export var type:Shell

func _ready():
	$Sprite2D.texture = type.texture
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.add_shell(type)
		body.print_shells()
		queue_free()
