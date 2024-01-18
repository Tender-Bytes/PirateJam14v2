extends Node2D

@onready var gold_gen = get_node("../default gold gen")
@onready var money = get_node("../Money")
@onready var button = get_node("Button")

const BASE_COST = 50
var cost
var upgrade_multiplier: int

# Called when the node enters the scene tree for the first time.
func _ready():
	cost = BASE_COST
	upgrade_multiplier = 2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if money.amount >= cost:
		money.change_value.emit(-cost)
		gold_gen.upgrade_pc.emit(upgrade_multiplier)
