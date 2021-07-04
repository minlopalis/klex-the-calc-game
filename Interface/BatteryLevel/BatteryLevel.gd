extends ProgressBar

const DANGER_ZONE = 25
const CAUTION_ZONE = 50
const WARNING_ZONE = 75

const DANGER_COLOR = Color.red
const CAUTION_COLOR = Color.orange
const WARNING_COLOR = Color.yellow
const HEALTHY_COLOR = Color.green

onready var fg_stylebox = get("custom_styles/fg")

#func _ready():
#	update_battery_level()

func _process(_delta):
	update_battery_level()
	pass

func update_battery_level():
	value = Gamestate.battery_life
	
	if value <= DANGER_ZONE:
		fg_stylebox.bg_color = DANGER_COLOR
	elif value <= CAUTION_ZONE:
		fg_stylebox.bg_color = CAUTION_COLOR
	elif value <= WARNING_ZONE:
		fg_stylebox.bg_color = WARNING_COLOR
	else:
		fg_stylebox.bg_color = HEALTHY_COLOR
