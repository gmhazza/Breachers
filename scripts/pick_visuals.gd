extends CenterContainer


@onready var pickable: TextureRect = $pick

func Show() -> void:
	pickable.show()

func Hide() -> void:
	pickable.hide()
