extends AnimatedSprite2D

@onready var progress = $"../Progress Bar UI/ProgressBar"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	progress.set_fire.connect(city_on_fire)


func city_on_fire():
	self.visible = true
	self.play("default")
	self.sprite_frames.set_animation_loop("default",true)
