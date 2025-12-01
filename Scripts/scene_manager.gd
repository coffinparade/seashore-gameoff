extends Node

@onready var shore := preload("res://seashore-gameoff/Scenes/shore.tscn")
@onready var journal := preload("res://seashore-gameoff/Scenes/journal.tscn")
@onready var menu := preload("res://seashore-gameoff/Scenes/Main Menu.tscn")
@onready var storyFile:=FileAccess.get_file_as_string("res://seashore-gameoff/Story.json")
var dayCount := 0
var story
var lastDay = 2

func _ready():
	story = JSON.parse_string(storyFile)
	

func nextScene(scene:bool):
	# if scene is false, open a journal scene, else open a shore scene
	print(dayCount)
	if dayCount==lastDay:
		print("To the main menu")
		get_tree().change_scene_to_packed(menu)
		dayCount = 0
	else:
		if scene:
			dayCount+=1
			get_tree().change_scene_to_packed(shore)
		else:
			get_tree().change_scene_to_packed(journal)

func journalText()->String:
	var text :String
	if story:
		text = story[str(dayCount)]
	return text
