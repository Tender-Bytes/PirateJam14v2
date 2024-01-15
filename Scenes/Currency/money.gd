extends Node2D

@onready var money_text = get_node("Label")

signal change_value(value: int)

var amount: int
# Called when the node enters the scene tree for the first time.
func _ready():
	amount = 0
	self.change_value.connect(change_money)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_money(value):
	amount += value
	money_text.change_amount(amount)
