extends CharacterBody2D

@onready var sprite = get_node("AnimatedSprite2D")
@onready var idleTimer = get_node("IdleTimer")
@onready var wanderTimer = get_node("WanderTimer")

const SPEED = 100
const MIN_TIME = 0.5
const MAX_TIME = 2
var x: float
var y: float
var idle: float
var wander: float
var direction: Vector2

func _ready():
	x = randf_range(-1, 1)
	y = randf_range(-1, 1)
	wander = randf_range(MIN_TIME, MAX_TIME)
	wanderTimer.set_wait_time(wander)
	direction = Vector2(x, y).normalized()
	wanderTimer.start()
	sprite.play()
	
	
func _physics_process(delta):
	if x > 0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false

	velocity = direction * SPEED
	move_and_slide()


func _on_wander_timer_timeout():
	direction = Vector2.ZERO
	sprite.stop()
	idle = randf_range(MIN_TIME, MAX_TIME)
	idleTimer.set_wait_time(idle)
	idleTimer.start()


func _on_idle_timer_timeout():
	wander = randf_range(MIN_TIME, MAX_TIME)
	wanderTimer.set_wait_time(wander)
	x = randf_range(-1, 1)
	y = randf_range(-1, 1)
	direction = Vector2(x, y).normalized()
	sprite.play()
	wanderTimer.start()
