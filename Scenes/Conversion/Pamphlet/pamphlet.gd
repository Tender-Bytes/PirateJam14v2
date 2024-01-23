extends Control

@onready var anim = get_node("AnimatedSprite2D")
@onready var pamphlet_text = get_node("pamphlet text")

var amount: int

# Called when the node enters the scene tree for the first time.
func _ready():
	amount = 0
	anim.play()


func change_pamphlet(value):
	amount = value
	pamphlet_text.change_amount(amount)
