'''
This script will help me manage the lines I will be showing throughout my game,
It will import lines from .txt files to implement them into layouts for the game.

textFileName = string containing directory of the file on which display the text.
'''
extends Control

@onready var text := $Text


var example_dict = {}

func _ready():
	var textFileName = "res://textlines/level_one/levelonetxt.txt"
	import_resources_data(textFileName)
	print("loaded")
	
func import_resources_data(textFileName: String):
	var file = FileAccess.open(textFileName, FileAccess.READ)

	while !file.eof_reached():
		var data_set = Array(file.get_csv_line())
		example_dict[example_dict.size()] = data_set
	file.close()
	print(example_dict)
