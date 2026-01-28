extends Control

#Variables
@onready var button = $"End Panel/MarginContainer/VBoxContainer/ChangeSceneButton"
@onready var label:=$CenterText
@onready var displayShells:=%ShellsInBasket.get_children()
var temp_cash:float
var game_ended:=false
var tween

#makes sure the end panel is hidden and that the shells will be shown from bottom to top of the basket
func _ready() -> void:
	$"End Panel".visible = false
	displayShells.reverse()

#animates the amount of money that is being added to the final counter
func _process(delta: float) -> void:
	if game_ended:
		temp_cash = lerp(temp_cash,ScoreTracker.get_cash(),5.0*delta)
		%MoneyDisplay.text = "$"+str("%0.2f" % temp_cash) 

#shows a label at the top of the screen for a split second in order to convey something
func showLabel(new_text:String):
	label.visible = true
	label.text = new_text
	await get_tree().create_timer(0.5).timeout
	label.visible = false

#updates the amount of shells that are shown in the basket by revealing some of the shells in the basket in the corner
func basketUpdate():
	var temp_shell_int = int(%BasketDisplay.text)
	for i in displayShells.size()-1:
		displayShells[i].visible = temp_shell_int>i

#shows how many of each shell has been collected when the timer is up
func end_screen(shells:Array[Shell]):
	var collectedTypes={
		"low":0,
		"lowmid":0,
		"mid":0,
		"midhigh":0,
		"high":0
	}
	
	button.modulate = Color("ffffff00")
	tween = get_tree().create_tween()
	game_ended = true
	$"End Panel".visible = true
	$"End Panel".modulate = Color.TRANSPARENT
	tween.tween_property($"End Panel","modulate",Color.WHITE,0.5)
	
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
	
	tween.tween_property(button,"modulate",Color.WHITE,1).set_delay(2.5)
