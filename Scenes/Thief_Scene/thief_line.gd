extends Node2D

@export var dir:int = -1
@export var time:int = 5

var thief_scene = preload("res://Scenes/Thief_Scene/thief_sprite.tscn")

func start_thief():
	spawn_thief()
	$Timer.wait_time = time
	$Timer.start()
	

func spawn_thief():
	var thief = thief_scene.instantiate()
	thief.position.x = 0
	thief.position.y = $points.points[randi()% $points.points.size()].y
	$Blimps.add_child(thief)
	move(thief)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func move(thief):
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR)

	tween.tween_property(thief,
	'position',
	Vector2((thief.position.x+1200)*dir,thief.position.y),
	10)
	
	await tween.finished
	thief.queue_free()


func _on_timer_timeout():
	spawn_thief()
