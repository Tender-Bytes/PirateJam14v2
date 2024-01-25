extends Control

@onready var anim = get_node("AnimatedSprite2D")
@onready var money_text = get_node("Label")
@export var crypto: int = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play()
	money_text.change_amount(crypto)
	Global.money_amount = crypto


func change_money(value):
	crypto += value
	Global.money_amount = crypto
	money_text.change_amount(crypto)
