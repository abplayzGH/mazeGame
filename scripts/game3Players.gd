extends Node

@onready var timer: Timer = $Timer
@onready var label: Label = $Label

@onready var player1 = $Player1
@onready var player2 = $Player2
@onready var player3 = $Player3

var time_left: int = 150  # Set the countdown time in seconds
var rng = RandomNumberGenerator.new()
var hunter = rng.randi_range(1, 3)
var hunter_score: int = 0

func _ready():
	print("Hunter: ", hunter)
	timer.wait_time = 1.0  # The timer ticks every second
	timer.start()
	update_label()
	timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	time_left -= 1
	update_label()
	
	if time_left <= 0:
		get_tree().change_scene_to_file("res://scenes/playerWin.tscn")

func update_label():
	label.text = "Time left: " + str(time_left)

func reset_game():
	get_tree().reload_current_scene()
	
	
func _on_area_2d_body_entered_1(body: Node2D) -> void:
	if hunter == 1:
		player1.sprite_2d.animation = "ghost"
	else:
		if body.name == "Player" + str(hunter):
			print("1 is die")
			player1.position = Vector2(1000,1000)
			hunter_score += 1
		if hunter_score >= 2:
			get_tree().change_scene_to_file("res://scenes/hunterWin.tscn")

func _on_area_2d_body_entered_2(body: Node2D) -> void:
	if hunter == 2:
		player2.sprite_2d.animation = "ghost"
	else:
		if body.name == "Player" + str(hunter) and body.name != "Player2":
			print("2 is die")
			player2.position = Vector2(1000,1000)
			hunter_score += 1
		if hunter_score >= 2:
			get_tree().change_scene_to_file("res://scenes/hunterWin.tscn")

func _on_area_2d_body_entered_3(body: Node2D) -> void:
	if hunter == 3:
		player3.sprite_2d.animation = "ghost"
	else:
		if body.name == "Player" + str(hunter) and body.name != "Player3":
			print("3 is die")
			player3.position = Vector2(1000,1000)
			hunter_score += 1
		if hunter_score >= 2:
			get_tree().change_scene_to_file("res://scenes/hunterWin.tscn")
