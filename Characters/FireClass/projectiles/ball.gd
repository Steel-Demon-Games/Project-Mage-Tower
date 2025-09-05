extends CharacterBody2D


func _physics_process(delta: float) -> void:
	move_and_slide()


func _on_timer_timeout() -> void:
	queue_free()
