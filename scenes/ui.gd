extends Control

@onready var label:=$CenterText

func times_up():
	label.visible = true
	label.text = "Time's Up!"
	await get_tree().create_timer(0.5).timeout
	label.visible = false


func end_screen():
	$"End Panel".visible = true
	$"End Panel/Label".text = "$"+str(ScoreTracker.get_cash())
