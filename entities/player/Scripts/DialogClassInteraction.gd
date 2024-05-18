extends StaticBody3D
class_name DialogClassInteraction

@export var prompt_action = "interact"
@onready var dialog := $"../DialogBox"

# Calls for a dialogbox entry: 

func dialogboxFunction(body):
	var textFileName = "res://textlines/level_one/levelonetxt.txt"
	print("Text open")
	dialog.dialogbox.show()	
	TextlineManagerShow.import_resources_data(textFileName)

