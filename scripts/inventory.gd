extends Control


func on_inventory_exit(event: InputEvent) -> void:
	if event is InputEventScreenTouch:
		hide()
