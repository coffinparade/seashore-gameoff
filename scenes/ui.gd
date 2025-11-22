extends Control

@onready var label:=$CenterText
var temp_cash:float
var game_ended:=false

func _ready() -> void:
	$"End Panel".visible = false

func _process(delta: float) -> void:
	if game_ended:
		temp_cash = lerp(temp_cash,ScoreTracker.get_cash(),5.0*delta)
		%MoneyDisplay.text = "$"+str("%0.2f" % temp_cash) 

func times_up():
	label.visible = true
	label.text = "Time's Up!"
	await get_tree().create_timer(0.5).timeout
	label.visible = false


func end_screen(shells:Array[Shell]):
	game_ended = true
	$"End Panel".visible = true
	
	var collectedTypes={
		"low":0,
		"lowmid":0,
		"mid":0,
		"midhigh":0,
		"high":0
	}
	for shell in shells:
		match shell.id:
			0: 
				collectedTypes["low"]+=1
			1:
				collectedTypes["lowmid"]+=1
			2:
				collectedTypes["mid"]+=1
			3:
				collectedTypes["midhigh"]+=1
			4:
				collectedTypes["high"]+=1
	%LowDisplayText.text = str(collectedTypes["low"])
	%LowMidDisplayText.text = str(collectedTypes["lowmid"])
	%MidDisplayText.text = str(collectedTypes["mid"])
	%MidHighDisplayText.text = str(collectedTypes["midhigh"])
	%HighDisplayText.text = str(collectedTypes["high"])
