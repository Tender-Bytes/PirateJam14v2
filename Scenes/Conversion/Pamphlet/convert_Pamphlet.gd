extends Node2D

@onready var button = get_node("Button")
@onready var pamphlet_UI = get_node("../ColorRect/MarginContainer/HBoxContainer/pamphlet")
@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")

signal total_pamphlets(owned: int)

const BASE_COST = 10
var cost : int
var pamphlets: int

# Called when the node enters the scene tree for the first time.
func _ready():
	cost = BASE_COST
	pamphlets = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	if Money.amount >= cost:
		pamphlets += 1
		money.change_money(-cost)
		cost = round(BASE_COST * pow(1.2, pamphlets))
		pamphlet_UI.change_pamphlet(pamphlets)
		total_pamphlets.emit(pamphlets)
		button.set_tooltip_text("Pamphlet cost: $" + str(cost))


