extends Node2D

@export var channel=0
@export var messages =[["everythign is ok","We love puppies","leader!!!"],
["everythign is somewhat ok","We love puppies that obey our leader","leader!"],
["everythign is bad","We hate puppies","leader!?!"],
["everythign is worse","We ate puppies","leader?????"],]

@onready var current_messages=0

var produ: float
# Called when the node enters the scene tree for the first time.
func _ready():
	$anchorboy.play("idle")
	pass # Replace with function body.

func cycle():
	var x=messages[current_messages]
	print(x[channel])
	channel+=1
	if channel>3:
		channel=0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func change_status():
	if current_messages ==1:
		$ColorRect.color=Color("yellow")
	elif current_messages ==2:
		$ColorRect.color= Color("orange")
	elif current_messages ==3:
		$ColorRect.color= Color("Red")
	elif current_messages ==0:
		$ColorRect.color= Color("green")


func _on_button_pressed():
	cycle()
		


func _on_progress_bar_converted_pop(pop):
	if pop<12.5:
		current_messages=0
	elif pop<25.0:
		current_messages=1
	elif pop<37.5:
		current_messages=2
	elif pop<50.1:
		current_messages=3
	change_status()
	 # Replace with function body.
