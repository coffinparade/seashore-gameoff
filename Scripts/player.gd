extends CharacterBody2D

@export var move_speed:=150.0
var weight_factor:=1.0
var _collectedShells:Array[Shell]
@onready var basketDisplay:=%BasketDisplay
@onready var anim := $AnimationPlayer
@onready var transition:=$CanvasLayer/UI/ColorRect
var can_move:=true

func _physics_process(delta: float) -> void:
	if can_move:
		var move_dir = Input.get_vector("move_left","move_right","move_up","move_down")
		velocity = move_dir*move_speed*weight_factor
		animate()
		$"Walking Particles".emitting = (velocity.x!=0||velocity.y!=0)&&!(velocity.y>0)
		move_and_slide()

func animate():
	if velocity.length()!=0:
		if velocity.y<0:
			anim.current_animation= "move_up"
		elif velocity.y>0:
			anim.current_animation="move_down"
		elif velocity.x >0:
			anim.current_animation = "move_right"
		elif velocity.x <0:
			anim.current_animation = "move_left"
	else:
		anim.current_animation = "idle"
func drop_shells():
	print( "hit")
	_collectedShells.clear()
	update_basket()


func print_shells():
	for shell in _collectedShells:
		print(str(shell.value)+" ")


func add_shell(shell:Shell):
	_collectedShells.append(shell)
	weight_factor-=0.05
	update_basket()


func store_shells():
	for shell in _collectedShells:
		ScoreTracker.increase_cash(shell.value)
	weight_factor = 1.0
	_collectedShells.clear()
	update_basket()


func update_basket():
	basketDisplay.text = str(_collectedShells.size())
