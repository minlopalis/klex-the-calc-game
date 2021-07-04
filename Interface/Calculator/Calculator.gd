extends Control

var memory = 0 as float
var operator = null
var totaled = false

onready var display = $CenterContainer/NinePatchRect/VBoxContainer/NinePatchRect/Display

onready var button0 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button0
onready var button1 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button1
onready var button2 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button2
onready var button3 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button3
onready var button4 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button4
onready var button5 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button5
onready var button6 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button6
onready var button7 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button7
onready var button8 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button8
onready var button9 = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Button9

onready var divide = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer2/Divide
onready var multiply = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer2/Multiply
onready var minus = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer2/Minus
onready var plus = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer2/Plus

onready var equals = $CenterContainer/NinePatchRect/VBoxContainer/CenterContainer/HBoxContainer/GridContainer/Equals


func _process(_delta):
	if Input.is_action_just_pressed("calculator") && Gamestate.has_logic_board:
		get_tree().paused = !get_tree().paused
		visible = get_tree().paused



func ready():
	visible = false
	display.text = str(memory)


func append_to_display(number):
	if display.text == "0":
		display.text = str(number)
	elif totaled == true:
		totaled = false
		display.text = str(number)
	else:
		display.text = str(display.text) + str(number)


func clear_display():
	display.text = "0"


func _on_Button7_pressed():
	append_to_display(7)


func _on_Button8_pressed():
	append_to_display(8)


func _on_Button9_pressed():
	append_to_display(9)


func _on_Button4_pressed():
	append_to_display(4)


func _on_Button5_pressed():
	append_to_display(5)


func _on_Button6_pressed():
	append_to_display(6)


func _on_Button1_pressed():
	append_to_display(1)


func _on_Button2_pressed():
	append_to_display(2)


func _on_Button3_pressed():
	append_to_display(3)


func _on_Button0_pressed():
	append_to_display(0)


func _on_Clear_pressed():
	operator = null
	clear_display()
	memory = 0


func _on_Equals_pressed():
	totaled = true
	if operator != null:
		if operator == "plus":
			display.text = str(float(memory + float(display.text)))
		elif operator == "minus":
			display.text = str(float(memory - float(display.text)))
		elif operator == "multiply":
			display.text = str(float(memory * float(display.text)))
		elif operator == "divide":
			display.text = str(float(memory / float(display.text)))


func _on_Divide_pressed():
	operator = "divide"
	memory = float(display.text)
	clear_display()


func _on_Multiply_pressed():
	operator = "multiply"
	memory = float(display.text)
	clear_display()


func _on_Minus_pressed():
	operator = "minus"
	memory = float(display.text)
	clear_display()


func _on_Plus_pressed():
	operator = "plus"
	memory = float(display.text)
	clear_display()


func _on_Close_pressed():
	visible = false
	get_tree().paused = false
