extends Node2D

@onready var gold_button = get_node("Button")
@onready var money = get_node("../Money")

signal add_pc(pc_amount: int)

var amount: int
var pc_owned: int

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_pc.connect(change_pc_owned)
	amount = 1
	pc_owned = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	amount = 1 * pc_owned
	money.change_value.emit(amount)

func change_pc_owned(value):
	pc_owned = value
	gold_button.set_text("Crypto Mining\n# of PC(adds $1 per click): " + str(pc_owned))
