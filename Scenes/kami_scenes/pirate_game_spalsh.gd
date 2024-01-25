extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("appear")
	await $AnimationPlayer.animation_finished
	$Timer.start()
	await $Timer.timeout
	switch_scene()
	pass # Replace with function body.

func switch_scene():
	get_tree().change_scene_to_file("res://Scenes/kami_scenes/kami_logo.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	switch_scene()
