extends TextureButton
@export var parti:Texture2D

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
		$hover.show()



func _on_hover_mouse_exited():
	if not(disabled):
		$hover.hide()


func _on_pressed():

	$emitter.position=get_local_mouse_position()
	$emitter.emitting=true
