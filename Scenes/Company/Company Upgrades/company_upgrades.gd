extends Node2D

@onready var pc_extra = $pc_extra
@onready var pc_upgrade = $pc_upgrade
@onready var steal_upgrade = $steal_upgrade

signal side_menu_button
signal add_pc(cost, pc_owned)
signal upgrade_pc(cost, multiplier)
signal add_thieves(cost, value)

func _ready():
	#for the demo:
	$side_button.visible = false
	pc_extra.add_pc.connect(_on_add_pc)
	pc_upgrade.upgrade_pc.connect(_on_upgrade_pc)
	steal_upgrade.add_thieves.connect(_on_add_thieves)
	
func _on_side_button_pressed():
	side_menu_button.emit()
	
func _on_add_pc(cost, pc_owned):
	add_pc.emit(cost, pc_owned)

func _on_upgrade_pc(cost, multiplier):
	upgrade_pc.emit(cost, multiplier)

func _on_add_thieves(cost, value):
	add_thieves.emit(cost, value)
