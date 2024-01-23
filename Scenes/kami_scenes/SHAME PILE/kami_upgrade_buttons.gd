extends Control
@export var menu_size=0.85
@export var speed =0.2

var down_anchor=Vector2(0,0)
var up_anchor=Vector2(0,menu_size)
var target_anchor = down_anchor
var popped_up=false


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#hrink()

func shrink():
	anchor_left=target_anchor.x
	anchor_right=target_anchor.y


func growo():
	anchor_left=up_anchor.x
	anchor_right=up_anchor.y

func _on_texture_button_pressed():
	if popped_up:
		shrink()
		popped_up=false
	else:
		growo()
		popped_up=true
		  # Replace with function body.
