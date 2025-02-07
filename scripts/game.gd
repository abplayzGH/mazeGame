extends Node

@onready var timer: Timer = $Timer
@onready var label: Label = $Label

var time_left: int = 120  # Set the countdown time in seconds

func _ready():
	timer.wait_time = 1.0  # The timer ticks every second
	timer.start()
	update_label()
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	time_left -= 1
	update_label()
	
	if time_left <= 0:
		reset_game()

func update_label():
	label.text = "Time left: " + str(time_left)

func reset_game():
	get_tree().reload_current_scene()
