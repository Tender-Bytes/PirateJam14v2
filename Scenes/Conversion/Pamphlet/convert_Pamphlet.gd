extends Node2D

@onready var button = get_node("Button")
@onready var pamphlet_UI = get_node("../ColorRect/MarginContainer/HBoxContainer/pamphlet")
@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")
@onready var anim = $Pamphlet_anim

signal total_pamphlets(owned: int)

const BASE_COST = 10
var cost : int
var pamphlets: int

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.visible = false
	anim.sprite_frames.set_animation_loop("default", false)
	cost = BASE_COST
	pamphlets = 0



func _on_button_pressed():
	if Global.money_amount >= cost:
		pamphlets += 1
		money.change_money(-cost)
		pamphlet_UI.change_pamphlet(pamphlets)
		total_pamphlets.emit(pamphlets)
		cost = round(BASE_COST * pow(1.2, pamphlets + 1))
		button.set_tooltip_text("Spread propaganda amongst the people!"
			+ "\nPamphlet cost: $" + str(cost)
		+ "\nConversion per tick: " + str(pamphlets*6))
		
		anim.visible = true
		anim.play("default")
		await $Pamphlet_anim.animation_finished
		anim.stop()
		anim.visible = false
