extends StaticBody3D
class_name DialogClassInteraction

signal interacted(body)

@export var prompt_action = "interact"
@onready var dialog := $"../DialogBox"

# Calls for a dialogbox entry: 

func dialogboxFunction(body):
	emit_signal("DialogClassInteraction", body)
	print("Text open")
	dialog.dialogbox.show()	

