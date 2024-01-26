extends Node2D

@onready var progress = $"../Progress Bar UI/ProgressBar"
@onready var police = $PoliceStation
@onready var police_destroyed = $DestroyedPolice

func _ready():
	police.visible = true
	progress.set_fire.connect(city_on_fire)


func city_on_fire():
	police.visible = false
	police_destroyed.visible = true
