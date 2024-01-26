extends Sprite2D

@onready var WOM = $"../Convert_WOM"
@onready var speak = $speaking

# Called when the node enters the scene tree for the first time.
func _ready():
	speak.visible = false
	WOM.WOM_clicked.connect(_on_WOM_clicked)
	speak.sprite_frames.set_animation_loop("default", false)


func _on_WOM_clicked():
	speak.visible = true
	speak.play()
	await speak.animation_finished
	speak.stop()
