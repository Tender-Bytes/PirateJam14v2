extends Node2D

@onready var area = get_node("Area2D/CollisionShape2D")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_exited(body):
	body.to_center(area.position)
