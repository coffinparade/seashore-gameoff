extends Creature

@onready var start_pos:Vector2 = global_position
@onready var target_pos:Vector2 = global_position+ _move_direction
var _move_direction:Vector2
var _move_speed:float=20.0
@onready  var anim :=$AnimationPlayer

func _ready():
	anim.current_animation = "new_animation"

func _physics_process(delta: float) -> void:
	global_position = global_position.move_toward(target_pos, _move_speed*delta)
	
	if roundf(global_position.x) == roundf(target_pos.x) and roundf(global_position.y) == roundf(target_pos.y):
		if start_pos == target_pos:
			target_pos = start_pos+_move_direction
		else:
			target_pos = start_pos


func set_move_dir(dir:Vector2):
	_move_direction = dir


func set_move_speed(s:int):
	_move_speed = s
