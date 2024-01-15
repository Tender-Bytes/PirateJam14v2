extends Node2D

@onready var gold_text = get_node("Label")
@onready var goldgen = get_node("../gold gen")
var money: int
# Called when the node enters the scene tree for the first time.
func _ready():
	goldgen.generate_gold.connect(add_money)
	money = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_money(value):
	money += value
	gold_text.change_amount(money)
