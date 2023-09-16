extends Node

func change_scene_safely(scene_path: String) -> void:
	if get_tree().change_scene_to_file(scene_path) != OK:
		print("An error occured when trying to load %s" % scene_path)
