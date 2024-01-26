extends Control

@onready var bar = get_node("ProgressBar")
@export var max_population : int = 100

signal converted_pop(value: float)
signal victory
var past_50=false
@onready var expo=$"../../middle_exposition"
# Called when the node enters the scene tree for the first time.
func _ready():
	bar.value = 0
	self.converted_pop.connect(charge_progress_bar)
	bar.max_value = 10000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func middle_cutscene():
	expo.show()
	expo.start()

func charge_progress_bar(pop):
	bar.value = pop
	if not(past_50) and pop>5000:
		past_50=true
		middle_cutscene()
	if((pop>9900)):
		get_tree().change_scene_to_file("res://Scenes/kami_scenes/kami_end_real.tscn")
