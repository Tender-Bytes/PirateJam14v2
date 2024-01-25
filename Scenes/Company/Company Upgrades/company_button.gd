extends TextureButton
@export var particles : Texture2D
@export var art : Texture2D
@export var timed = true
@export var audio=AudioStreamWAV


var original_size = scale 
var grow_size = scale * 1.06

# Called when the node enters the scene tree for the first time.
func _ready():
	pivot_offset=size/2
	if particles:
		$emitter.texture = particles
	else:
		$emitter.hide()
	if art:
		$picture.texture = art
	if audio:
		$sound.stream=audio
	 # Replace with function body.


func _on_mouse_entered():
	if not(disabled):
		change_button_size(grow_size,.1)
		$hover.show()

#WHEN HOVER ASSET FIXED UNCOMMENT THIS
#func _on_hover_mouse_exited():
	#change_button_size(original_size,.1)
	#$hover.hide()

#CAN DELETE WHEN HOVER ASSET FIXED
func _on_mouse_exited():
	change_button_size(original_size,.1)
	$hover.hide()


func change_button_size(size:Vector2, duration:float):
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self,'scale',size,duration)


func _on_pressed():
	$emitter.position=get_local_mouse_position()
	$emitter.emitting=true
	$sound.play()
	if timed:
		self.disabled = true
		


