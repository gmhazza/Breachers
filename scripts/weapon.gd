extends Node3D


signal fire

var is_muzzle_equipped: bool = false
var firing: bool = false


func _ready() -> void:
	fire.connect(fired)

func fired() -> void:
	if not firing:
		firing = true
		var bullet: Bullet = preload("res://data/weapons/bullet.tscn").instantiate()
		bullet.global_transform = $muzzle.global_transform
		$AnimationPlayer.play("fire")
		get_tree().root.add_child(bullet)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fire":
		firing = false
