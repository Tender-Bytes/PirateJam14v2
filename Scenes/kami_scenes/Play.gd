extends Button

var og_size=scale 
var g_size=Vector2(1.1,1.1)
@onready var y
# Called when the node enters the scene tree for the first time.
func _ready():
	y=get_parent().get_node("menu Sound Ui")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


# Replace with function body.


func _on_mouse_entered():
	grow_btn(g_size,.1)
	y.play()

	
	
	
func grow_btn(size:Vector2, duration:float):
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self,'scale',size,duration)
	

func _on_mouse_exited():
	grow_btn(og_size,.1) # Replace with function body.
