extends Node2D

@onready var pc_extra = $pc_extra

signal side_menu_button
signal add_pc(cost, pc_owned)

func _ready():
	pc_extra.add_pc.connect(_on_add_pc)
	
func _on_add_pc(cost, pc_owned):
	add_pc.emit(cost, pc_owned)


func _on_side_button_pressed():
	side_menu_button.emit()
