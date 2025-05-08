extends Area2D

@export var speed := 600
var direction = Vector2.RIGHT

# Preload particle scene at the top
var HitParticles = preload("res://HitParticles.tscn")

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if body.name == "Ant":
		return  # Ignore the Ant

	if body.name == "Spider":
		if body.has_method("trigger_effect"):
			body.trigger_effect()

		# Spawn particles at collision point
		var particles = HitParticles.instantiate()
		get_parent().add_child(particles)
		particles.global_position = global_position
		particles.emitting = true  # Start the particle effect

	queue_free()  # Remove the bullet
