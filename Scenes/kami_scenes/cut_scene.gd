extends Control
@export var words:String
@export var img:Texture2D
var tween
signal next
# Called when the node enters the scene tree for the first time.
func _ready():
	$story.text=words
	$Image.texture=img
	var x
	var y
	#$Image.self_modulate=Color("white",0)
	pivot_offset=size/2
	tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_parallel()
	x= words.length()

	tween.tween_property($Image,"self_modulate",Color("white",255.0),1)
	tween.tween_property($story,"visible_ratio",1,x*0.07)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_texture_button_pressed():
	if tween.is_running():
		tween.pause()
		$story.visible_ratio=1
	else:
		emit_signal("next")
	#print("skip") # Replace with function body.
