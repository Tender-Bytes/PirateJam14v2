extends Node2D

@export var scroll_time:int =0.17
@export var max_length: int = 1000
@export var popped_up=false

@export var max_width:int=300
@export var popped_up_2=false


signal opened
signal closed
@onready var og_pos= self.position

# Called when the node enters the scene tree for the first time.
func _ready():
	#$Rooms.position=Vector2(0,0)
	pass # Replace with function body.

func grow():
	var tween=create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self,"position",Vector2(self.position.x,self.position.y-max_length),scroll_time)

func shrink():
	var tween=create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self,"position",Vector2(self.position.x,self.position.y+max_length),scroll_time)

func grow_h():
	var tween=create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property($Side_menu,"position",Vector2($Side_menu.position.x+max_width,$Side_menu.position.y),scroll_time)

func shrink_h():
	var tween=create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property($Side_menu,"position",Vector2($Side_menu.position.x- max_width,$Side_menu.position.y),scroll_time)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_texture_button_pressed():
	if popped_up:
		shrink()
	else:
		grow()
	popped_up=not(popped_up)


func _on_side_button_pressed():
	if popped_up_2:
		shrink_h()
	else:
		grow_h()
	popped_up_2=not(popped_up_2)
