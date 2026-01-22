extends StaticBody2D
@onready var player:=get_tree().get_first_node_in_group("player")
@onready var particlesGen := $CPUParticles2D
var showParticles:=false

func _process(_delta):
	if player.position.y<position.y:
		z_index=1
	else:
		z_index=0
