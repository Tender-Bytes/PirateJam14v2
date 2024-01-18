extends Node2D

@onready var base_pos = Vector2(690,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	move() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
	
func move():
	$Timer.start()
	$clouds.position=base_pos
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN)
	tween.tween_property($clouds,'position',Vector2($clouds.position.x-1700,$clouds.position.y),57)
	await $Timer.timeout

	move()

