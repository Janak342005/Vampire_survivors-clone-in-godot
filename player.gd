extends CharacterBody2D

signal game_over

var health = 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		get_node("HappyBoo").play_walk_animation()
	else:
		get_node("HappyBoo").play_idle_animation()
	
	
	
	const DAMEGE_RATE = 5.0
	
	var overlapping_mobs  = %HurtBox.get_overlapping_bodies()
	
	if overlapping_mobs.size() > 0.0:
		health -= DAMEGE_RATE * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			game_over.emit()
	
