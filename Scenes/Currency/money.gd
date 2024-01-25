extends Control

@onready var anim = get_node("AnimatedSprite2D")
@onready var money_text = get_node("Label")


var crypto: int
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play()
	#set default amount to 100 for testing
	crypto = 0
	money_text.change_amount(crypto)
	Money.amount = crypto


func change_money(value):
	crypto += value
	Money.amount = crypto
	money_text.change_amount(crypto)
