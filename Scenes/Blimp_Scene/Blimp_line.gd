extends Node2D
@export var dir:int = -1
@export var time:int = 15
var blimp_scene = preload("res://Scenes/Blimp_Scene/Blimp_sprite.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func start_blimp():
	spawn_blimp()
	$Timer.wait_time = time
	$Timer.start()
	

func spawn_blimp():
	var blimp = blimp_scene.instantiate()
	blimp.position.x = 0
	blimp.position.y = $points.points[randi()% $points.points.size()].y
	$Blimps.add_child(blimp)
	move(blimp)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func move(blimp):
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR)

	tween.tween_property(blimp,
	'position',
	Vector2((blimp.position.x+1200)*dir,blimp.position.y),
	20)
	
	await tween.finished
	blimp.queue_free()


func _on_timer_timeout():
	spawn_blimp()
