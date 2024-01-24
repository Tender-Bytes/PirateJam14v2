extends Node2D

#@onready var pamphlet_text = get_node("Text")
@onready var pamphlet_UI = get_node("../ColorRect/MarginContainer/HBoxContainer/pamphlet")
@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")

signal total_pamphlets(owned: int)

const cost = 10
var pamphlets: int

# Called when the node enters the scene tree for the first time.
func _ready():
	pamphlets = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	if money.amount >= cost:
		pamphlets += 1
		#pamphlet_text.set_text("Pamphlet cost: $" + str(cost) +"\npamplets owned: " + str(pamphlets))
		pamphlet_UI.change_pamphlet(pamphlets)
		money.change_money(-cost)
		total_pamphlets.emit(pamphlets)



