extends Node2D
@export var dir:int =1
@export var time:int =5
var car=preload("res://Scenes/kami_scenes/kami_car.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Timer.wait_time=time
	var y = car.instantiate()
	spawn_car()
	pass # Replace with function body.

func spawn_car():
	var y = car.instantiate()
	y.position.x=self.position.x
	y.position.y=$points.points[randi()% $points.points.size()].y
	y.dir=dir
	$cars.add_child(y)
	move(y)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func move(y):
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(y,'position',Vector2((y.position.x+1090)*dir,y.position.y),30)
	await tween.finished
	y.queue_free()

func _process(delta):
	pass


func _on_timer_timeout():
	spawn_car()
	pass # Replace with function body.
