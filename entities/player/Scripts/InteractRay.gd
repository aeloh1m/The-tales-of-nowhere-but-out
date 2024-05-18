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
		var detected = get_collider()
		
		if detected is Interactable:	
			prompt.text = detected.name

			if Input.is_action_just_pressed(detected.prompt_action):
				detected.interact(owner)
			
		elif detected is DialogClassInteraction:
			if Input.is_action_just_pressed(detected.prompt_action):
				detected.dialogboxFunction(owner)

			
'''
Bueno, yo tengo la interacción que abre y cierra la ventanita, ahora.
según el rayo qué hago, abro en otra función la ventanita por separado al interactiar
asignándola a un dialogbox function.
---
Bueno tengo la clase que hace las interacciones:
	Ahora necesito dividir las interacciones que haga, en cuánto
	se sepa qué es lo que está tocando el rayo.
'''
