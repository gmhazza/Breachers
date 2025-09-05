extends RigidBody3D
class_name Bullet

var time: float = 3.0

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if time > 0:
		time -= delta
		apply_force((global_transform.basis * Vector3(1, 0, 0)).normalized())
	else:
		queue_free()

func on_collision(collider: Node3D) -> void:
	collider.queue_free()
	queue_free()










func tex():
	pass
