extends CharacterBody3D
class_name Player


@export var speed: float = 5.0
@export var jumpForce: float = 4.5
@export var sway: float = 25.0

@export_category("Mouse Events")
@export_range(0.0, 1.0) var sensitivity: float = 0.3
@export_range(-90, 90) var max_view_angle: float = 90
@export_range(-90, 90) var min_view_angle: float = -90

@onready var joystick: Joystick = $canvas/UI/Joystick
@onready var head: Node3D = $Head
@onready var hand: Node3D = $Head/hand
@onready var handpos: Node3D = $Head/handpos
@onready var ray: RayCast3D = $Head/Camera/RayCast




func on_slider_slide(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		rotate_y(deg_to_rad(-1 * event.relative.x * sensitivity))
		head.rotate_x(deg_to_rad(-1 * event.relative.y * sensitivity))
		head.rotation.x = clampf(head.rotation.x, deg_to_rad(min_view_angle), deg_to_rad(max_view_angle))

func _process(delta: float) -> void:
	hand.global_position = handpos.global_position
	hand.rotation.y = lerp_angle(hand.rotation.y, rotation.y, sway * delta)
	hand.rotation.x = lerp_angle(hand.rotation.x, head.rotation.x, sway * delta)
	if ray.is_colliding():
		if ray.get_collider().is_in_group("weapon"):
			get_tree().quit()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jumpForce
	var input_dir: Vector2 = joystick.get_direction()
	var direction: Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	move_and_slide()
