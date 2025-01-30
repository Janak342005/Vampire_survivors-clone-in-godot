extends Node2D

var survival_time = 0

func spawn_mob():
	
	survival_time += 1
	
	var new_mob = preload("res://mob.tscn").instantiate()
	
	%spwan_point.progress_ratio = randf()
	
	new_mob.global_position = %spwan_point.global_position
	
	get_parent().add_child(new_mob)
	



func _on_timer_timeout() -> void:
	spawn_mob()
	


func _on_player_game_over() -> void:
	%Game_over.visible = true
	get_tree().paused = true
	%Survival_Time.text = "You survived for %.2f seconds" % survival_time
	
	
	
	
