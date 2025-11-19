extends Node2D


@export var wave_time :=20.0
@export var day_time:= 10.0
var last_detect_time:float
@onready var wave_anim = $Wave/AnimationPlayer
@onready var collectibleContainer = $CollectibleContainer
@onready var creatureContainer = $CreatureContainer
@onready var timeDisplay = $Player/CanvasLayer/UI/TimeDisplay
@onready var player = %Player
var new_collectible
var new_creature
@onready var start_time = Time.get_unix_time_from_system()
var time_left:float

func _ready():
	timeDisplay.max_value = day_time


func _process(_delta: float) -> void:
	var time = Time.get_unix_time_from_system()
	time_left = day_time-(time-start_time)
	timeDisplay.value = time_left
	if time-last_detect_time>wave_time:
		last_detect_time = time
		await _reset_shore()
		_spawn_shore()


func _reset_shore():
	if time_left<0:
		_end_game()
		pass
	wave_anim.current_animation = "wave_up"
	wave_anim.queue("wave_down")
	wave_anim.queue("still")
	
	await wave_anim.animation_changed
	
	for creature in creatureContainer.get_children():
		creature.queue_free()
	for collectible in collectibleContainer.get_children():
		collectible.queue_free()
	

func _spawn_shore():
	# create collectibles
	for i in randi_range(5,15):
		new_collectible = ShellGrades.collectableShell.instantiate()
		new_collectible.type = ShellGrades.shellGrades[randi_range(0,ShellGrades.shellGrades.size()-1)]
		new_collectible.set_texture()
		new_collectible.global_position = Vector2(randi_range(-1500,1500),randi_range(-200,750))
		collectibleContainer.add_child(new_collectible)
	#create creatures 
	var test
	for i in randi_range(0,10):
		test = randf()>0.7
		if test:
			new_creature = CreatureScenes.moving_creature.instantiate()
			new_creature.set_move_dir(Vector2.from_angle(randf_range(0,TAU))*randi_range(100,300))
			new_creature.set_move_speed(randi_range(40,100))
		else:
			new_creature = CreatureScenes.still_creature.instantiate()
		new_creature.global_position = Vector2(randi_range(-1300,1300),randi_range(-200,650))
		creatureContainer.add_child(new_creature)


func _on_collection_area_body_entered(body):
	if body.is_in_group("player"):
		body.store_shells()

func _end_game():
	player.can_move = false
	player.time_out()
