extends Node2D

@export var channel=0
@export var messages =[["everythign is ok","We love puppies","leader!!!"],
["everythign is somewhat ok","We love puppies that obey our leader","leader!"],
["everythign is bad","We hate puppies","leader!?!"]]

@onready var current_messages=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func cycle():
	var x=messages[current_messages]
	print(x[channel])
	channel+=1
	if channel>2:
		channel=0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_down"):
		change_status()


func change_status():
	current_messages+=1
	if current_messages ==1:
		$ColorRect.color=Color("yellow")
	elif current_messages ==2:
		$ColorRect.color= Color("Red")

func _on_button_pressed():
	cycle()
		
