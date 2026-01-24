extends StaticBody2D
@onready var player:=get_tree().get_first_node_in_group("player")

func _ready():
	$Sprite2D.frame = randi_range(0,2)
func _process(_delta):
	if player.position.y<position.y:
		z_index=1
	else:
		z_index=0
