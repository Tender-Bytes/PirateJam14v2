extends AnimatedSprite2D

@onready var progress = $"../Progress Bar UI/ProgressBar"
@onready var fire_sound = $"Fire Sound"

var is_fire = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	progress.set_fire.connect(city_on_fire)


func city_on_fire():
	if not is_fire:
		self.visible = true
		self.play("default")
		self.sprite_frames.set_animation_loop("default",true)
		fire_sound.play()
		is_fire = true
