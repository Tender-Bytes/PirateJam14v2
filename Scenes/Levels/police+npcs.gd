extends Node2D

@onready var area = get_node("Area2D/CollisionShape2D")
@onready var WOM = get_node("../../Convert_WOM")
@onready var npc_1 = $npc_1
@onready var npc_2 = $npc_2
@onready var npc_3 = $npc_3
@onready var npc_1_exclam = $"npc_1/!"
@onready var npc_2_exclam = $"npc_2/!"
@onready var npc_3_exclam = $"npc_3/!"


func _ready():
	WOM.WOM_clicked.connect(_on_WOM_clicked)

func _on_police_npc_area_2d_body_exited(body):
	body.to_center(area.position)

func _on_WOM_clicked():
	npc_1._on_WOM()
	npc_2._on_WOM()
	npc_3._on_WOM()
	npc_1_exclam.visible = true
	npc_2_exclam.visible = true
	npc_3_exclam.visible = true
	await get_tree().create_timer(1.5).timeout
	npc_1_exclam.visible = false
	npc_2_exclam.visible = false
	npc_3_exclam.visible = false
