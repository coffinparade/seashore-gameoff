extends Area2D

@onready var sprite = $AnimatedSprite2D
func shellCount(i:int):
	if i==0:
		sprite.frame=0
	elif i<=3:
		sprite.frame=1
	elif i<=6:
		sprite.frame=2
	elif i<=8:
		sprite.frame=3
	elif i<=13:
		sprite.frame=4
	elif i<=16:
		sprite.frame=5
	elif i<=19:
		sprite.frame=6
	elif i<=23:
		sprite.frame=7
	elif i<=30:
		sprite.frame=8
