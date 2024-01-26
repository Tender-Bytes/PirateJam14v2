extends Control

@onready var bar = get_node("ProgressBar")
@onready var middle_exp = preload("res://Scenes/kami_scenes/kami_middle.tscn")
@export var max_population : int = 100


signal converted_pop(value: float)
signal victory
signal set_fire
signal stop_music
signal stop_convert
var past_50=false

# Called when the node enters the scene tree for the first time.
func _ready():
	bar.value = 0
	self.converted_pop.connect(charge_progress_bar)
	bar.max_value = 10000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#SCENE START CALL HERE
func middle_cutscene():
	var x = middle_exp.instantiate()
	get_parent().get_parent().add_child(x)
	x.start()

func charge_progress_bar(pop):
	bar.value = pop
	if not(past_50) and pop>5000:
		past_50=true
		middle_cutscene()
		stop_music.emit()
		stop_convert.emit()
	if pop > 6500:
		set_fire.emit()
	if((pop>9900)):
		get_tree().change_scene_to_file("res://Scenes/kami_scenes/kami_end_real.tscn")
