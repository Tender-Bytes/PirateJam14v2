extends Node2D

@onready var button = $TextureButton

signal add_thieves(cost, value)

const BASE_COST = 100
var cost : int
var pop_requirement : int = 500
var value : int = 1

func _ready():
	cost = BASE_COST
	
	button.set_tooltip_text("Employ thieves to steal for you!"
	+ "\nPopulation Requirement: " + str(pop_requirement)
	+ "\nEmployment Cost: $" + str(cost))


func _on_button_pressed():
	if Global.pop_amount >= pop_requirement:
		add_thieves.emit(-cost, value)
		cost += cost
		pop_requirement += pop_requirement
		value += 1
		
		button.set_tooltip_text("Employ thieves to steal for you!"
		+ "\nPopulation Requirement: " + str(pop_requirement)
		+ "\nEmployment Cost: $" + str(cost)
		+ "\nPassive Income: $" + str(value-1)
		+ " per second")
