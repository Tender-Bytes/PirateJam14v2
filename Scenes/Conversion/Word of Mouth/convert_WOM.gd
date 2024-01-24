extends Node2D

#@onready var WOM_text = get_node("Text")
@onready var WOM_UI = get_node("../ColorRect/MarginContainer/HBoxContainer/WOM")
@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")

signal total_WOM(owned: int)

const cost = 2
var WOMs: int

# Called when the node enters the scene tree for the first time.
func _ready():
	WOMs = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	if money.amount >= cost:
		WOMs += 1
		#WOM_text.set_text("Word of Mouth cost: $" + str(cost) +"\nWord of Mouth owned: " + str(WOMs))
		WOM_UI.change_WOM(WOMs)
		money.change_money(-cost)
		total_WOM.emit(WOMs)
