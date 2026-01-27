extends Node

@onready var shore := preload("res://seashore-gameoff/Scenes/shore.tscn")
@onready var journal := preload("res://seashore-gameoff/Scenes/journal.tscn")
@onready var menu := preload("res://seashore-gameoff/Scenes/Main Menu.tscn")
@onready var storyFile:=FileAccess.get_file_as_string("res://seashore-gameoff/Story.json")
@onready var musicVolume := 0.0
@onready var sfxVolume := 0.0

var dayCount := -1
var story
var lastDay = 4

func _ready():
	story = JSON.parse_string(storyFile)
	

func nextScene(scene:bool):
	# if scene is 0 open a journal scene, if 1 open a shore scene
	print(dayCount)
	if dayCount==lastDay:
		print("To the main menu")
		get_tree().change_scene_to_packed(menu)
		dayCount = 0
	else:
		if scene:
			get_tree().change_scene_to_packed(shore)
		else:
			get_tree().change_scene_to_packed(journal)
			dayCount+=1

func journalText()->String:
	var text :String
	if story:
		text = story[str(dayCount)]
	return text
