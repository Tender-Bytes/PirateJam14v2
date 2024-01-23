extends Node2D

@export var imgs:Array[Texture2D]
@export var lines:Array[String]
@export var number_of_slides: int

@onready var base_cutscene=preload("res://Scenes/kami_scenes/kami_cutscene.tscn")

@onready var positionsss= Vector2(357,197)
@onready var current=0
@onready var t
# Called when the node enters the scene tree for the first time.
func _ready():
	await $Timer.timeout
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_parallel()
	tween.tween_property($Menu_art_1,"self_modulate",Color("193051"),1)
	tween.tween_property($Menu_art_2,"self_modulate",Color("193051"),1)
	print(lines)
	play_cutscene(0)
	 # Replace with function body.

func play_cutscene(i):
	var y =base_cutscene.instantiate()
	y.words=lines[i]
	y.img=imgs[i]
	y.position=positionsss
	$scenesss.add_child(y)
	y.next.connect(_on_cut_scene_next)
	t=y
	current+=1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass





func _on_skip_skip():
	get_tree().change_scene_to_file("res://Scenes/kami_scenes/Main menu.tscn") # Replace with function body.


func _on_cut_scene_next():
	t.queue_free()
	if current>=number_of_slides:
		print("onto game")
		get_tree().change_scene_to_file("res://Scenes/Levels/overworld.tscn")
	else:
		play_cutscene(current)
