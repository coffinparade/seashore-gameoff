extends CharacterBody2D

@export var move_speed:=150.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	var move_dir = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = move_dir*move_speed
	
	$GPUParticles2D.emitting = (velocity.x!=0||velocity.y!=0)&&!(velocity.y>0)
	move_and_slide()
