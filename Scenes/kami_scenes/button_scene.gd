extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
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
