extends Area2D
@export var move_direction:Vector2
@export var move_speed:=20.0

@onready var start_pos:Vector2 = global_position
@onready var target_pos:Vector2 = global_position + move_direction
#make creature move along fixed path between 2 points chosen at random
