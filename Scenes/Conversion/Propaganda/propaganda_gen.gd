extends Node2D

@onready var propaganda_button = get_node("Button")
@onready var money = get_node("../Money")

signal total_pamphlets(owned: int)

var pamphlets: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pamphlets = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	if money.amount >= 10:
		pamphlets += 1
		propaganda_button.set_text("Propaganda gen $10\npamplets: " + str(pamphlets))
		money.change_value.emit(-10)
		total_pamphlets.emit(pamphlets)
