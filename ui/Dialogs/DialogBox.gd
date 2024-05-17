extends TextureRect
class_name DialogBox

var dialogbox = true

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = dialogbox	


	print("Hey i'm the fucker", dialogbox)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
