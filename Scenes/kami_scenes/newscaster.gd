extends Node2D

@export var channel=0
@export var messages =[["everythign is ok","We love puppies","leader!!!"],
["everythign is somewhat ok","We love puppies that obey our leader","leader!"],
["everythign is bad","We hate puppies","leader!?!"],
["everythign is worse","We ate puppies","leader?????"],]
signal news_change( news:String)
@onready var current_messages=0

var produ: float
var showing=false
# Called when the node enters the scene tree for the first time.
func _ready():
	$anchorboy.play("idle")
	$news_zoom/anchorboy2.play("idle")
	cycle()
	Animate_news()
	pass # Replace with function body.

func cycle():
	var x=messages[current_messages]
	news_change.emit(x[channel])
	print(x[channel])
	channel+=1
	if channel>2:
		channel=0
	
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func change_status():
	if current_messages ==1:
		$ColorRect.color=Color("yellow")
	elif current_messages ==2:
		$ColorRect.color= Color("orange")
	elif current_messages ==3:
		$ColorRect.color= Color("Red")
	elif current_messages ==0:
		$ColorRect.color= Color("green")


func _on_button_pressed():
	print("switch_news")
	$news_zoom.show()
	showing=true
	#cycle()
		
func Animate_news():
	var tween= create_tween().set_trans(Tween.TRANS_LINEAR)
	var x= $news_zoom/news.text.length()
	#tween.tween_method(remove_letters,$news_zoom/news.text.length(),0,0.02)
	#await tween.finished
	tween.tween_property($news_zoom/news,"text","",500)

func remove_letters(siz):
	$news_zoom/news.text= $news_zoom/news.text.erase(0,1)


func _on_progress_bar_converted_pop(pop):
	if pop<12.5:
		current_messages=0
	elif pop<25.0:
		current_messages=1
	elif pop<37.5:
		current_messages=2
	elif pop<50.1:
		current_messages=3
	cycle()
	change_status()
	 # Replace with function body.


func _on_button_mouse_entered():
	#$news_zoom.show()
	pass





func _on_button_mouse_exited():
	$news_zoom.hide()
	showing=false
