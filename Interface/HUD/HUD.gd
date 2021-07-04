extends CanvasLayer

onready var CoinCount = $Control/LifeCoinContainer/HBoxContainer/CoinCount
onready var LifeCount = $Control/LifeCoinContainer/HBoxContainer/LifeCount
onready var BatteryLife = $Control/BatteryLife/ProgressBar
onready var ObjectiveLabel = $Control/Objective/ObjectiveLabel
onready var ObjectiveImage = $Control/Objective/ObjectiveImage
onready var Level = $Control/Level

var healthy_color = Color(0,1,0,1)
var warning_color = Color(1,1,0,1)
var danger_color = Color(1,0,0,1)

const WARNING_VALUE = 66
const DANGER_VALUE = 33


func _process(_delta):
	update_counter()
	update_current_objective()
	update_battery_life()
	update_level()

func update_counter():
	LifeCount.text = str(Gamestate.lives)
	CoinCount.text = str(Gamestate.coins)

func update_current_objective():
	ObjectiveLabel.text = "Objective: " + str(Gamestate.current_objective)
	ObjectiveImage.texture = Gamestate.current_objective_icon


func update_battery_life():
	if Gamestate.battery_life > WARNING_VALUE:
		BatteryLife.self_modulate = healthy_color
	elif Gamestate.battery_life > DANGER_VALUE:
		BatteryLife.self_modulate = warning_color
	else:
		BatteryLife.self_modulate = danger_color
		
	BatteryLife.value = Gamestate.battery_life


func update_level():
	Level.text = "Level " + str(Gamestate.current_level)
