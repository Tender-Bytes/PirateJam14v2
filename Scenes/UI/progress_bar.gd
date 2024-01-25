extends Control

@onready var bar = get_node("ProgressBar")

signal converted_pop(value: float)
signal win
# Called when the node enters the scene tree for the first time.
func _ready():
	bar.value = 0
	self.converted_pop.connect(charge_progress_bar)
	bar.max_value = 10000

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func charge_progress_bar(pop):
	bar.value = pop
