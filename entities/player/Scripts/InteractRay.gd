extends RayCast3D
@onready var neck := $Neck
@onready var prompt := $Prompt

# Called when the node enters the scene tree for the first time.
func _ready():
	add_exception(neck) # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	prompt.text = ""
	if is_colliding():
		prompt.text = "Alright that is a cube"
