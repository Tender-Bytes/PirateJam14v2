extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text("Amount of gold: 0")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func change_amount(value):
	set_text("Amount of gold: " + str(value))
