extends TextureButton
@export var parti:Texture2D
var og_size=scale 
var g_size=Vector2(1.06,1.06)

# Called when the node enters the scene tree for the first time.
func _ready():
	if parti:
		$emitter.texture=parti
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mouse_entered():
	if not(disabled):
		grow_btn(g_size,.1)
		$hover.show()



func _on_hover_mouse_exited():
	if not(disabled):
		grow_btn(og_size,.1)
		$hover.hide()

func grow_btn(size:Vector2, duration:float):
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self,'scale',size,duration)


func _on_pressed():

	$emitter.position=get_local_mouse_position()
	$emitter.emitting=true
