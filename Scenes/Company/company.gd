extends Node2D

@export var scroll_time: float =0.1
@export var max_length: int = 1000
@export var max_width:int=300
@export var popped_up=false
@export var popped_up_2=false

@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")
@onready var gold_gen = get_node("../default gold gen")
@onready var og_pos= self.position
@onready var company_upgrade = $company_upgrades

signal opened
signal closed

var row_check:int =0

# Called when the node enters the scene tree for the first time.
func _ready():
	company_upgrade.side_menu_button.connect(_on_side_button_pressed)
	company_upgrade.add_pc.connect(_on_add_pc)
	company_upgrade.upgrade_pc.connect(_on_upgrade_pc)


func _on_texture_button_pressed():
	if popped_up:
		move_company(-max_length)
	else:
		move_company(max_length)
	popped_up=not(popped_up)


func _on_side_button_pressed():
	if popped_up_2:
		move_upgrades(-max_width)
	else:
		move_upgrades(max_width)
	popped_up_2 = not(popped_up_2)


func _on_add_pc(cost, pc_owned):
	money.change_money(cost)
	gold_gen.change_pc_owned(pc_owned)


func _on_upgrade_pc(cost, multiplier):
	money.change_money(cost)
	gold_gen.upgrade_pc_owned(multiplier)


func move_company(length):
	var tween=create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(self,
	"position",
	Vector2(self.position.x,self.position.y - length),
	scroll_time)


func move_upgrades(width):
	var tween=create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property($company_upgrades,
	"position",
	Vector2($company_upgrades.position.x + width,
	$company_upgrades.position.y),
	scroll_time)


func _on_company_upgrades_add_pc(cost, pc_owned):
	$VBoxContainer/Rooms.get_child(row_check).add_pc() # Replace with function body.


func _on_room_switch_row():
	row_check+=1 # Replace with function body.



func _on_company_upgrades_upgrade_pc(cost, multiplier):
	for i in $VBoxContainer/Rooms.get_children():
		i.upgrade() # Replace with function body.
