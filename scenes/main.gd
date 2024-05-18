extends Node3D

@onready var dialogbox = get_node("DialogBox")
@onready var interactray = $Player/Neck/InteractRay

# Called when the node enters the scene tree for the first time.
func _ready():
	dialogbox.toggleDialogBox.connect(toggleDialogBoxInGame) # Replace with function body.

func toggleDialogBoxInGame() -> void:
	dialogbox.visible = not dialogbox.visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
