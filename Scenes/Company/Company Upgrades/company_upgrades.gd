extends Node2D

signal side_menu_button


func _on_side_button_pressed():
	side_menu_button.emit()
