extends CharacterBody2D

@export var move_speed:=150.0

@onready var basketDisplay:=%BasketDisplay
@onready var anim := $AnimationPlayer
@onready var transition:=$CanvasLayer/UI/ColorRect

var can_move:=true
var weight_factor:=1.0
var _shellBasket:Array[Shell]
var _collectedShells:Array[Shell]

func _physics_process(_delta: float) -> void:
	#player shouldn't be able to move at the end of the level, checks for that
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
	_shellBasket.clear()
	update_basket()


func print_shells():
	for shell in _shellBasket:
		print(str(shell.value)+" ")


func add_shell(shell:Shell):
	_shellBasket.append(shell)
	weight_factor-=0.05
	update_basket()


func store_shells():
	for shell in _shellBasket:
		ScoreTracker.increase_cash(shell.value)
		_collectedShells.append(shell)
	weight_factor = 1.0
	_shellBasket.clear()
	update_basket()


func update_basket():
	basketDisplay.text = str(_shellBasket.size())


func time_out():
	await $CanvasLayer/UI.times_up()
	$CanvasLayer/UI.end_screen(_collectedShells)


func hit():
	drop_shells()
	modulate = Color(0.734, 0.0, 0.158, 1.0)
	await get_tree().create_timer(0.25).timeout
	modulate = Color(1.0, 1.0, 1.0, 1.0)
