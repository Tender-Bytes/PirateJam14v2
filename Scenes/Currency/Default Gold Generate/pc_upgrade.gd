extends Node2D

signal upgrade_pc(cost, multiplier)

@onready var button = $TextureButton


var cost = [50, 100]
var type = ["CPU Based", "GPU Based", "ASIC Based"]
var iteration : int = 0
var upgrade_multiplier: int = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	button.set_tooltip_text("Upgrade computers for faster mining!\n" 
	+ "Upgrade computers: $" + str(cost[iteration])
	+ "\nCurrent mining rig: "+ str(type[iteration]))


func _on_button_pressed():
	if Global.money_amount >= cost[iteration] and iteration < 2:
		upgrade_pc.emit(-cost[iteration], upgrade_multiplier)
		iteration += 1
	
	if iteration < 2:
		button.set_tooltip_text("Upgrade computers for faster mining!\n" 
		+ "Upgrade computers: $" + str(cost[iteration])
		+ "\nCurrent mining rig: "+ str(type[iteration]))
	else:
		button.set_tooltip_text("Max Upgrade reached!" 
		+ "\nCurrent mining rig: "+ str(type[iteration]))
		button.disabled = true

