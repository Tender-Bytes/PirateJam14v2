extends Node2D

@onready var money = get_node("../ColorRect/MarginContainer/HBoxContainer/Money")
@onready var button = get_node("Control")
@onready var timer = get_node("GoldProgress/Timer")
@onready var bar = get_node("GoldProgress/ProgressBar")
@onready var thief_timer = get_node("thief_timer")

signal upgrade_pc(pc_upgrade : int)

var amount : int
var pc_owned : int
var thief_value : int

# Called when the node enters the scene tree for the first time.
func _ready():
	self.upgrade_pc.connect(upgrade_pc_owned)
	thief_value = 0
	amount = 1
	pc_owned = 1
	button.set_tooltip_text("$" + str(pc_owned) + " per click")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	change_money()
	button.disabled = false

func change_money():
	amount = 1 * pc_owned
	money.change_money(amount)

func change_pc_owned(value):
	pc_owned = value
	button.set_tooltip_text("$" + str(pc_owned) + " per click")

func upgrade_pc_owned(value):
	timer.wait_time /= value
	bar.max_value = timer.wait_time

func start_steal_upgrade(value):
	if thief_value == 0:
		thief_timer.start()
	thief_value = value

func _on_thief_timer_timeout():
	money.change_money(thief_value)
