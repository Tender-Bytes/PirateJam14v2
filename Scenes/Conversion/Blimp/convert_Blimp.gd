extends Node2D

@onready var blimp_line = get_node("../Blimp line")
@onready var blimp_UI = get_node("../ColorRect/MarginContainer/HBoxContainer/blimp")
#@onready var blimp_text = get_node("Text")
@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")

signal total_blimps(owned: int)

const cost = 50
var blimps: int

# Called when the node enters the scene tree for the first time.
func _ready():
	blimps = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_button_pressed():
	if money.amount >= cost:
		blimps += 1
		#blimp_text.set_text("Blimp cost: $" + str(cost) +"\nBlimps owned: " + str(blimps))
		blimp_UI.change_blimp(blimps)
		money.change_money(-cost)
		total_blimps.emit(blimps)
	if blimps == 1:
		blimp_line.start_blimp()



