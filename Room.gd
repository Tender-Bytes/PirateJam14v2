extends Control
@export var number_of_pc=0
@export var texture:Array[Texture2D]
@export var upgrade_lvele_num:int=0
@onready var p_stack=preload("res://Scenes/kami_scenes/kami_pc_stack.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	add_pc() # Replace with function body.

func add_pc():
	number_of_pc+=1
	if number_of_pc%3==1:
		var j = p_stack.instantiate()
		j.texture=texture
		j.upgrade_level=upgrade_lvele_num
		$stacks.add_child(j)
		print("added")
	else:
		$stacks.get_child($stacks.get_child_count()-1).add_pc()

func upgrade():
	upgrade_lvele_num+=1
	for i in $stacks.get_children():
		i.upgrade()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		add_pc()
	if Input.is_action_just_pressed("ui_up"):
		upgrade()
