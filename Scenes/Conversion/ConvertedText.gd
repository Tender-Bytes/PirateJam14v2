extends Label

@onready var convert = get_node("..")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_amount(value):
	set_text("People converted: " + str(value))


func _on_pamplet_timer_timeout():
	convert.pamphlet_production.emit()