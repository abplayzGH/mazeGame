extends Control

	
	
func _on_player_start_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_player_start_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game3.tscn")


func _on_player_start_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game4.tscn")



func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial screen.tscn")
