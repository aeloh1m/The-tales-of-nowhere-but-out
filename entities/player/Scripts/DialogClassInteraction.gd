extends StaticBody3D
class_name DialogClassInteraction

@export var prompt_action = "interact"
@onready var dialog := $"../DialogBox"
@onready var dialogtext := $"../DialogBox/DialogText"


# Calls for a dialogbox entry: 

func dialogboxFunction(body):
	var textFileName = "res://textlines/level_one/levelonetxt.txt"
	print("Text open")
	dialog.dialogbox.show()	
	
	var textArray
	textArray = TextlineManagerShow.import_resources_data(textFileName)
	print(textArray, "new me")
	print(textArray[0], "cero me")
	
	dialogtext.text = str(textArray[0]).replace("[", "")

