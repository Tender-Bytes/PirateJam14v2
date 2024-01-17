extends Node2D

@onready var gold_gen = get_node("../default gold gen")
@onready var money = get_node("../Money")

var pc_owned: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pc_owned = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if money.amount >= 5:
		pc_owned += 1
		gold_gen.add_pc.emit(pc_owned)
		money.change_value.emit(-5)
