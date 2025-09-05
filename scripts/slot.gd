extends Panel
class_name Slot

func load_image(path: String) -> void:
	var image: Image 

func _ready() -> void:
	print("Ready to use " + String(name))
