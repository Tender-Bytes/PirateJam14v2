extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.flip_h = true
	self.play("default")
	self.sprite_frames.set_animation_loop("default",true)
