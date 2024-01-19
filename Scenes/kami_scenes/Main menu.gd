extends Node2D

@onready var base_pos = Vector2(690,0)
@export var transition_time=0.8
@export var grow_size=1.4
var play=false
# Called when the node enters the scene tree for the first time.
func _ready():
	move() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print($Timer.time_left)
	#print($clouds.position.x)
	pass

	
	
func move():
	$Timer.start()
	$clouds.position=base_pos
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.tween_property($clouds,'position',Vector2(-1783,$clouds.position.y),63)
	await $Timer.timeout
	move()



func _on_exit_pressed():
	get_tree().quit() # Replace with function body.


func _on_play_pressed():
	play=true
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN).set_parallel(true)
	
	#tween.tween_property($clouds,'scale',Vector2(grow_size,grow_size),transition_time)
	#tween.tween_property($clouds,'position',Vector2(0,-220),transition_time)
	
	tween.tween_property($Menu_art_1,'scale',Vector2(grow_size,grow_size),transition_time)
	tween.tween_property($Menu_art_1,'self_modulate',Color("white",255),transition_time)
	tween.tween_property($Menu_art_1,'position',Vector2(153,-262),transition_time)
	
	#tween.tween_property($background_gray,'position',Vector2(0,-661),transition_time)
	tween.tween_property($Menu_art_2,'scale',Vector2(grow_size,grow_size),transition_time)
	tween.tween_property($Menu_art_2,'self_modulate',Color("white",255),transition_time)
	tween.tween_property($Menu_art_2,'position',Vector2(153,399),transition_time)
	
	tween.tween_property($borders,'scale',Vector2(grow_size,grow_size),transition_time)
	tween.tween_property($borders/ColorRect3,'self_modulate',Color("white",0),transition_time)

	tween.tween_property($TEXT,'scale',Vector2(grow_size,grow_size),transition_time)
	
	$Play.hide()
	$Credits.hide()
	$Exit.hide()
	$clouds.hide()

	tween.chain().tween_property($TEXT,'self_modulate',Color("white",0),transition_time-0.4)
	print("start") # Replace with function body.
