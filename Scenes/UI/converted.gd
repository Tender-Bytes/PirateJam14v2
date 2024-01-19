extends Node2D

@onready var converted_text = get_node("Label")
@onready var Pamphlet = get_node("../Convert_Pamphlet")
@onready var bar = get_node("../Conversion Progress Bar")

signal pamphlet_production()


var pamphlet_owned: int
var production_total: float

# Called when the node enters the scene tree for the first time.
func _ready():
	self.pamphlet_production.connect(change_pamphlet_production)
	Pamphlet.total_pamphlets.connect(change_pamphlet_owned)
	pamphlet_owned = 0
	$Pamplet_Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_pamphlet_owned(owned):
	pamphlet_owned = owned

func change_pamphlet_production():
	production_total += 0.3 * pamphlet_owned
	converted_text.change_amount(production_total)
	bar.converted_pop.emit(production_total)
