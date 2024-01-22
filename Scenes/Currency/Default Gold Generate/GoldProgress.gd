extends Control

@onready var bar = get_node("ProgressBar")
@onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	bar.max_value = timer.wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.time_left != 0:
		bar.value = timer.wait_time - timer.time_left
	else:
		bar.value = bar.max_value


func _on_control_pressed():
	timer.start()
