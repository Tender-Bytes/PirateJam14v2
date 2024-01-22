extends Node2D
@export var types:int =3
@export var dir:int =1
@onready var y= [
	preload("res://Sprites/car_1.tres"),
	preload("res://Sprites/car_2.tres"),
	preload("res://Sprites/car_3.tres")
]

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$AnimatedSprite2D.sprite_frames=y[randi_range(0,2)]
	if not(dir):
		$AnimatedSprite2D.flip_h=true
	$AnimatedSprite2D.play("default")
	$AnimatedSprite2D.sprite_frames.set_animation_loop("default",true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
