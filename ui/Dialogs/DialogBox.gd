extends TextureRect
class_name DialogBox

@onready var dialogbox = $"."
var dialogOnOff = false
# Called when the node enters the scene tree for the first time.
func _ready():
	dialogbox.hide()

	
	print("Hey i'm the fucker", dialogbox)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dialogOnOff:
		dialogbox.show()
