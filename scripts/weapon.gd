extends Node3D


var is_muzzle_equipped = false

var muzzle: Node3D


func _ready() -> void:
	muzzle = preload("res://data/weapons/silencer.tscn").instantiate()

func add_muzzle() -> void:
	if muzzle:
		$muzzle.add_child(muzzle)
		is_muzzle_equipped = true

func delete_muzzle() -> void:
	if muzzle and $muzzle.get_child(1):
		$muzzle.get_child(1).queue_free()
