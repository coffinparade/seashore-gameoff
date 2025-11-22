extends Resource
class_name Shell

@export var texture:Texture2D
@export var value:float
@export var id:int

func _init() -> void:
	texture = preload("res://icon.svg")
	value = 1.0
	id = 0
