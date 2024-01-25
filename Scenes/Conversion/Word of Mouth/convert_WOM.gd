extends Node2D

@onready var button = get_node("Button")
@onready var WOM_UI = get_node("../ColorRect/MarginContainer/HBoxContainer/WOM")
@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")

signal total_WOM(owned: int)

const BASE_COST = 2
var cost : int
var WOMs: int

# Called when the node enters the scene tree for the first time.
func _ready():
	WOMs = 1
	cost = BASE_COST


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	if Money.amount >= cost:
		WOMs += 1
		money.change_money(-cost)
		cost = round(BASE_COST * pow(1.2, WOMs))
		WOM_UI.change_WOM(WOMs)
		total_WOM.emit(WOMs)
		button.set_tooltip_text("Word of Mouth cost: $" + str(cost))
