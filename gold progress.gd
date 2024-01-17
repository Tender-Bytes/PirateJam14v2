extends Control

func _ready():
	pass

func _on_timer_timeout():
	$ProgressBar.value += 1
	$Label.text = str("")
