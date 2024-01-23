extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



	 # Replace with function body.


func _on_upgrade_menu_opened():
	$upgrade_buttons.position.y=0
	pass # Replace with function body.


func _on_upgrade_menu_closed():
	$upgrade_buttons.position.y=648
	pass # Replace with function body.
