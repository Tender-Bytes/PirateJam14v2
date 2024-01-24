extends Node2D


signal add_pc(cost, pc_owned)

@onready var button = $TextureButton
var pc_owned: int
const BASE_COST = 5
var cost

# Called when the node enters the scene tree for the first time.
func _ready():
	pc_owned = 1
	cost = BASE_COST
	button.set_tooltip_text("Buy more computers: $" + str(cost)
	+ "\nNumber of PCs Owned: "+ str(pc_owned))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	if Money.amount >= cost:
		pc_owned += 1
		add_pc.emit(-cost, pc_owned)
		cost = round(BASE_COST * pow(1.2, pc_owned))
		button.set_tooltip_text("Buy more computers: $" + str(cost)
		+ "\nNumber of PCs Owned: "+ str(pc_owned))

