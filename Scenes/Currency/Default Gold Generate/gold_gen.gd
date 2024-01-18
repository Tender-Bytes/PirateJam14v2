extends Node2D

@onready var money = get_node("../Money")
@onready var button = get_node("Control")
@onready var timer = get_node("GoldProgress/Timer")
@onready var bar = get_node("GoldProgress/ProgressBar")

signal add_pc(pc_amount: int)
signal upgrade_pc(pc_upgrade: int)

var amount: int
var pc_owned: int

# Called when the node enters the scene tree for the first time.
func _ready():
	self.add_pc.connect(change_pc_owned)
	self.upgrade_pc.connect(upgrade_pc_owned)
	amount = 1
	pc_owned = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	change_money()
	button.disabled = false

func change_money():
	amount = 1 * pc_owned
	money.change_value.emit(amount)

func change_pc_owned(value):
	pc_owned = value

func upgrade_pc_owned(value):
	timer.wait_time /= value
	bar.max_value = timer.wait_time

