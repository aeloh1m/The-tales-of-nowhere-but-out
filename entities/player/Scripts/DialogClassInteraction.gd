extends StaticBody3D
class_name DialogClassInteraction

@export var prompt_action = "interact"
@onready var dialog := $"../DialogBox"
@onready var dialogtext := $"../DialogBox/DialogText"

var currentIndex = 0

# Calls for a dialogbox entry: 

func dialogboxFunction(body):
	print("Text open")
	dialog.dialogbox.show()
	dialogBoxRead()	

func formatValueFromDict(valueToFormat: String):
	var regex = RegEx.new()
	regex.compile("\\[|\\]|\\\\|\"")

	var matches = regex.search_all(valueToFormat)

	var formattedText = regex.sub(valueToFormat, "", true)
	print(formattedText, "real formatted")
		
	return formattedText
	
func yield_until_input(action: String, currentIndex) -> void:
	while not Input.is_action_just_pressed(action):
		await get_tree().process_frame

func dialogBoxRead():
	var textLinesDict
	var textFileName = "res://textlines/level_one/levelonetxt.txt"
	var flag = true
	textLinesDict = TextlineManagerShow.import_resources_data(textFileName)
	print(textLinesDict, "new me")
	print(textLinesDict[0], "cero me")
	
	
	dialogtext.text = str(textLinesDict[0]).replace("[", "")
#	if wholeDictLength / 2 == 0:
#		trueHalve = 2
	for key in textLinesDict:
		
		var value = textLinesDict[key]
		var valueToString
		var formattedValue
		valueToString = str(value) 
		formattedValue = formatValueFromDict(valueToString)
		
		currentIndex = formattedValue
		
		print(formattedValue)
		dialogtext.text = formattedValue

		while flag:
			if Input.is_action_just_pressed('next'):
				flag = false
			await get_tree().process_frame

		flag = true
#	for indexQuantity in range(len(textLinesDict)):
#		print(len(textLinesDict))
#		if str(textLinesDict[indexQuantity]) == "":
#			break
		#await Input.is_action_just_pressed("next")
		# print(textLinesDict[indexQuantity], indexQuantity)
	print("yeah bitch")
'''
What I can do is just loop and make a flag with both the conditions the flag to be true and the
indexQuantity to be same as the array length.

By now I have the for loop that does not compute every index yet, what should I do?
so, for instance we're using await fn, I might be able to get it working if I give a
flag too, 
'''
