extends MarginContainer

@onready var label = $MarginContainer/Label
@onready var timer = $LetterDisplayTimer

const MAX_WIDTH = 256

var text = ""
var letterIndex = 0

var letterTime = 0.03
var spaceTime = 0.06
var punctuationTime = 0.02

signal finished_displaying()

func displayText(textToDisplay: String):
	text = textToDisplay
	label.text = textToDisplay
	await resized
	custom_minimum_size.x = min(size.x, MAX_WIDTH)

	if size.x > MAX_WIDTH:
		label.autowrap_mode = TextServer.AUTOWRAP_WORD
		await resized
		await resized
		custom_minimum_size.y = size.y
	
	global_position.x -= size.x / 2
	global_position.y -= size.y + 24

	label.text = ""
	_display_letter()

func _display_letter():
	label.text += text[letterIndex]

	letterIndex += 1
	if letterIndex >= text.lenght():
		finished_displaying.emit()
		return

	match text[letterIndex]:
		"!",".",",","?":
			timer.start(punctuationTime)
		" ":
			timer.start(spaceTime)
		_:
			timer.start(letterTime)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_letter_display_timer_timeout():
	_display_letter() # Replace with function body.
