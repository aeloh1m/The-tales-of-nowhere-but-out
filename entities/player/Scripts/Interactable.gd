extends StaticBody3D
class_name Interactable

signal interacted(body)
signal toggleDialogBox()

@onready var dialog = $"../DialogBox"
@export var prompt_message = "Interact"
@export var prompt_action = "interact"

func get_prompt():
	var key_name = ""
	for action in InputMap.action_get_events(prompt_action):
		if action is InputEventKey:
			key_name = OS.get_keycode_string(action.scancode)

	return prompt_message + "\n[" + key_name + "]"
	
func interact(body):
	emit_signal("interacted", body)
	print("interaction")
	dialog.dialogbox.show()
		

# Calls for a dialogbox entry:

const lines: Array[String] = [
	"So far so good, this is the present",
	"game dialog."
]


func dialogBoxEntry():
	remove_child(dialog)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
