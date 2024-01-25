extends Node2D

@onready var button = get_node("Button")
@onready var blimp_line = get_node("../Blimp line")
@onready var blimp_UI = get_node("../ColorRect/MarginContainer/HBoxContainer/blimp")
@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")

signal total_blimps(owned: int)

const BASE_COST = 75
var cost : int
var blimps: int

# Called when the node enters the scene tree for the first time.
func _ready():
	cost = BASE_COST
	blimps = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	if Money.amount >= cost:
		blimps += 1
		money.change_money(-cost)
		cost = round(BASE_COST * pow(1.2, blimps))
		blimp_UI.change_blimp(blimps)
		total_blimps.emit(blimps)
		button.set_tooltip_text("Blimp cost: $" + str(cost))
	if blimps == 1:
		blimp_line.start_blimp()



