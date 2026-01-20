extends CharacterBody2D

@export var move_speed:=150.0
@export var hit_speed:=4000.0

@onready var basketDisplay:=%BasketDisplay
@onready var anim := $AnimationPlayer
@onready var transition:=$CanvasLayer/UI/ColorRect

const weight_default:=1.0
const weight_change:=0.05

var can_move:=true
var weight_factor:=weight_default

var _shellBasket:Array[Shell]
var _collectedShells:Array[Shell]

#shows the word go for a bi then it'll disappear
func _ready():
	$CanvasLayer/UI.showLabel("Go!")


func _physics_process(_delta: float) -> void:
	#player shouldn't be able to move at the end of the level or when hit, checks for that
	if can_move:
		var move_dir = Input.get_vector("move_left","move_right","move_up","move_down")
		velocity = move_dir*move_speed*weight_factor
		animate()
		$"Walking Particles".emitting = (velocity.x!=0||velocity.y!=0)&&!(velocity.y>0)
		move_and_slide()


#checks what direction the player is moving in and changes to corresponding animation
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


#removes all the shells from the player's basket
func drop_shells():
	_shellBasket.clear()
	update_basket()
	weight_factor = weight_default

#helper/test function
func print_shells():
	for shell in _shellBasket:
		print(str(shell.value)+" ")

#increases weight that the player is carrying and adds shell to basket
func add_shell(shell:Shell):
	_shellBasket.append(shell)
	weight_factor-=weight_change
	update_basket()

#takes all the shells, tracks their value, adds them to a more permanent collected shells basket,
#then drops the duplicate shells in the basket
func store_shells():
	for shell in _shellBasket:
		ScoreTracker.increase_cash(shell.value)
		_collectedShells.append(shell)
	drop_shells()


func update_basket():
	basketDisplay.text = str(_shellBasket.size())
	$CanvasLayer/UI.basketUpdate()


func time_out():
	await $CanvasLayer/UI.showLabel("Time's Up!")
	$CanvasLayer/UI.end_screen(_collectedShells)

#makes the player drop all their shells, makes them move away from the enemy, and makes them red for a quarter of a second
func hit(enemy_position:Vector2):
	drop_shells()
	
	velocity = Vector2.from_angle(enemy_position.angle_to_point(position))*hit_speed
	move_and_slide() 
	
	modulate = Color(0.734, 0.0, 0.158, 1.0)
	can_move = false
	
	await get_tree().create_timer(0.25).timeout
	
	modulate = Color(1.0, 1.0, 1.0, 1.0)
	can_move=true

#goes to the next journal scene
func _on_change_scene_button_pressed():
	SceneManager.nextScene(0)
