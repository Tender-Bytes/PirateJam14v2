extends AudioStreamPlayer

@onready var progress = get_node("../Progress Bar UI/ProgressBar")
var middle_cut

# Called when the node enters the scene tree for the first time.
func _ready():
	self.play()
	progress.stop_music.connect(_on_stop_music)


func _on_stop_music():
	self.stop()
	middle_cut = get_node("../middle_exposition")
	middle_cut.start_music.connect(_on_start_music)

func _on_start_music():
	self.play()
