extends Area2D

@onready var particles = $HeartParticles

func _on_body_entered(body):
	if body.is_in_group("flower"):
		particles.emitting = true
		queue_free()  # or just hide/remove enemy
