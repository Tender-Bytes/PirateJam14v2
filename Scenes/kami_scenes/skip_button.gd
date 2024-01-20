extends Button

var og_size=scale 
var g_size=Vector2(1.1,1.1)
@onready var y
signal skip
# Called when the node enters the scene tree for the first time.

func _ready():
	pivot_offset=Vector2(size/2)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Replace with function body.


func _on_mouse_entered():
	grow_btn(g_size,.1)

	
	
	
func grow_btn(size:Vector2, duration:float):
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self,'scale',size,duration)
	

func _on_mouse_exited():
	grow_btn(og_size,.1) # Replace with function body.


func _on_button_down():
	print("mawaru")
	$rotate.play("rotate")


func _on_button_up():
	if ($rotate.current_animation_position>=$rotate.current_animation_length):
		emit_signal("skip")
	else:
		pass
	$rotate.stop()# Replace with function body.
