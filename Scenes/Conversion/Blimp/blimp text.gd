extends Label


func _ready():
	set_text(": 0")


func change_amount(value):
	set_text(": " + str(value))
