extends Node2D

@onready var money = get_node("../Money")

var amount: int

# Called when the node enters the scene tree for the first time.
func _ready():
	amount = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	money.change_value.emit(amount)
