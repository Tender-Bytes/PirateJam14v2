extends Control

@onready var anim = get_node("AnimatedSprite2D")
@onready var blimp_text = get_node("blimp text")

var amount: int

# Called when the node enters the scene tree for the first time.
func _ready():
	amount = 0
	anim.play()


func change_blimp(value):
	amount = value
	blimp_text.change_amount(amount)
