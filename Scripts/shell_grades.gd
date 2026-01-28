extends Node

var highGrade = preload("res://seashore-gameoff/Resources/highGradeShell.tres")
var midHighGrade = preload("res://seashore-gameoff/Resources/midHighGradeShell.tres")
var midGrade = preload("res://seashore-gameoff/Resources/midGradeShell.tres")
var midLowGrade = preload("res://seashore-gameoff/Resources/lowMidGradeShell.tres")
var lowGrade = preload("res://seashore-gameoff/Resources/lowGradeShell.tres")
var collectableShell = preload("res://seashore-gameoff/Scenes/collectible.tscn")
var shellGrades:Array[Shell] = [highGrade,midHighGrade,midGrade,midLowGrade,lowGrade]
