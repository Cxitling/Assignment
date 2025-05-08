extends StaticBody2D

@onready var heart_particles = $HeartParticles
@onready var hit_particles = $HitParticles

var is_hit = false

func trigger_effect():
	if not is_hit:
		is_hit = true
		heart_particles.emitting = true
		hit_particles.emitting = true
		queue_free()  # Optional: remove spider after hit
