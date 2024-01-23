extends Control

@onready var anim = get_node("AnimatedSprite2D")
@onready var WOM_text = get_node("WOM text")

var amount: int

# Called when the node enters the scene tree for the first time.
func _ready():
	amount = 0
	anim.play()


func change_WOM(value):
	amount = value
	WOM_text.change_amount(amount)
