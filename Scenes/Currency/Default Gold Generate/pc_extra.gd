extends Node2D

@onready var gold_gen = get_node("../Crypto Gen")
@onready var money = get_node("../Money")
@onready var button = get_node("Button")

var pc_owned: int
const BASE_COST = 5
var cost

# Called when the node enters the scene tree for the first time.
func _ready():
	pc_owned = 1
	cost = BASE_COST


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if money.amount >= cost:
		money.change_value.emit(-cost)
		pc_owned += 1
		cost = round(BASE_COST * pow(1.2, pc_owned))
		button.set_text("Buy more computers: $" + str(cost)
		+ "\nNumber of PCs Owned: "+ str(pc_owned))
		gold_gen.add_pc.emit(pc_owned)
