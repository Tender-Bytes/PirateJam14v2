extends Control
@export var menu_size=0.85
@export var speed =0.2

@onready var down_anchor=Vector2(1,1+menu_size)
@onready var  up_anchor=Vector2(1-menu_size,1)
@onready var  target_anchor = down_anchor
@onready var  popped_up=false

signal opened
signal closed
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#hrink()

func shrink():
	anchor_top=target_anchor.x
	anchor_bottom=target_anchor.y
	emit_signal("closed")
func growo():
	anchor_top=up_anchor.x
	anchor_bottom=up_anchor.y
	emit_signal("opened")


func _on_texture_button_pressed():
	if popped_up:
		shrink()
		popped_up=false
	else:
		growo()
		popped_up=true
		  # Replace with function body.
