extends Node

var loader: AsyncScene = null

func _on_quit_pressed() -> void:
	get_tree().quit(0)


func _on_offline_pressed() -> void:
	loader = AsyncScene.new("res://data/world/prototype.tscn", AsyncScene.LoadingSceneOperation.Replace)
	loader.OnComplete.connect(loaded)

func loaded() -> void:
	loader.ChangeScene()


func _on_online_pressed() -> void:
	loader = AsyncScene.new("res://data/interface/online_root.tscn", AsyncScene.LoadingSceneOperation.Replace)
	loader.OnComplete.connect(loaded)
