extends Node2D

@onready var words = $story.text
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("begi ")
	await $AnimationPlayer.animation_finished
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_parallel()
	var x= words.length()
#	tween.tween_property($Image,"self_modulate",Color("white",255.0),1)
	tween.tween_property($story,"visible_ratio",1,x*0.04)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
