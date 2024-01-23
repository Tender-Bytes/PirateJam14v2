extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	set_text(": $0")


func change_amount(value):
	set_text(": $" + str(value))
