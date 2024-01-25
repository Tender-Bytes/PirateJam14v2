extends Control

@onready var converted_text = get_node("Label")
@onready var bar = get_node("../../../../Progress Bar UI/ProgressBar")
@onready var WOM = get_node("../../../../Convert_WOM")
@onready var Pamphlet = get_node("../../../../Convert_Pamphlet")
@onready var Blimp = get_node("../../../../Convert_Blimp")

signal WOM_production()
signal pamphlet_production()
signal blimp_production()

var WOM_owned : int
var pamphlet_owned: int
var blimp_owned: int
var production_total: float

# Called when the node enters the scene tree for the first time.
func _ready():
	self.WOM_production.connect(change_WOM_production)
	self.pamphlet_production.connect(change_pamphlet_production)
	self.blimp_production.connect(change_blimp_production)
	WOM.total_WOM.connect(change_WOM_owned)
	Pamphlet.total_pamphlets.connect(change_pamphlet_owned)
	Blimp.total_blimps.connect(change_blimp_owned)
	WOM_owned = 0
	pamphlet_owned = 0
	blimp_owned = 0
	$WOM_Timer.start()
	$Pamplet_Timer.start()
	$Blimp_Timer.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_WOM_owned(owned):
	WOM_owned = owned

func change_pamphlet_owned(owned):
	pamphlet_owned = owned

func change_blimp_owned(owned):
	blimp_owned = owned

func change_WOM_production():
	production_total += 1 * WOM_owned
	converted_text.change_amount(production_total)
	bar.converted_pop.emit(production_total)

func change_pamphlet_production():
	production_total += 6 * pamphlet_owned
	converted_text.change_amount(production_total)
	bar.converted_pop.emit(production_total)

func change_blimp_production():
	production_total += 37 * blimp_owned
	converted_text.change_amount(production_total)
	bar.converted_pop.emit(production_total)
