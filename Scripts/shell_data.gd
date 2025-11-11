extends Resource
class_name Shell

@export var texture:Texture2D
@export var value:int

func _init() -> void:
	texture = preload("res://icon.svg")
	value = 1
