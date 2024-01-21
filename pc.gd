extends Control
@export var upgrade_level:int =0
@export var number_in_stack:int =0
@export var texture:Texture2D 


# Called when the node enters the scene tree for the first time.
func _ready():
	$computer_1.frame=upgrade_level
	$computer_2.frame=upgrade_level
	$computer_3.frame=upgrade_level
	add_pc() # Replace with function body.

func add_pc():
	number_in_stack+=1
	match number_in_stack:
		1:
			$computer_1.show()
			$computer_2.hide()
			$computer_3.hide()
		2:
			$computer_1.show()
			$computer_2.show()
			$computer_3.hide()
		3:
			$computer_1.show()
			$computer_2.show()
			$computer_3.show()

func upgrade():
	upgrade_level+=1
	for i in get_children():
		i.frame+=1
		

func _process(delta):
	pass
