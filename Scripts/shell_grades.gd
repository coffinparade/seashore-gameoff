extends Node

var highGrade = preload("res://seashore-gameoff/resources/highGradeShell.tres")
var midHighGrade = preload("res://seashore-gameoff/resources/midHighGradeShell.tres")
var midGrade = preload("res://seashore-gameoff/resources/midGradeShell.tres")
var midLowGrade = preload("res://seashore-gameoff/resources/lowMidGradeShell.tres")
var lowGrade = preload("res://seashore-gameoff/resources/lowGradeShell.tres")
var collectableShell = preload("res://seashore-gameoff/scenes/collectible.tscn")
var shellGrades:Array[Shell] = [highGrade,midHighGrade,midGrade,midLowGrade,lowGrade]
