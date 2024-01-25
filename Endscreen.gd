extends Node2D

@onready var words = $story.text

@export var beg:Array[String]

@onready var t= beg.size()
@onready var r = 0
var tween
# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("begi ")
	await $AnimationPlayer.animation_finished

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	$AudioStreamPlayer2D.play()
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property($VBoxContainer/TextureRect,"modulate",Color("red",120.0),1)
	$Timer.start()
	await $Timer.timeout
	var tween2 =create_tween().set_trans(Tween.TRANS_LINEAR).set_parallel(true)
	tween2.tween_property($ColorRect2,"modulate",Color("white",255.0),3)
	tween2.tween_property($ColorRect2,"color",Color("black",255),3)
	await tween2.finished
	get_tree().change_scene_to_file("res://Scenes/kami_scenes/pirate_game_spalsh.tscn")
	
