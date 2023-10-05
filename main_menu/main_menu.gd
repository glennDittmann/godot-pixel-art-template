extends Control


func _ready():
	$GameButton.grab_focus()


func _process(delta):
	_update_background()


func _update_background():
	if $GameButton.is_hovered() or $GameButton.has_focus():
		$Background.play("game")
	elif $OptionsButton.is_hovered() or $OptionsButton.has_focus():
		$Background.play("options")
	elif $QuitButton.is_hovered() or $QuitButton.has_focus():
		$Background.play("quit")
	else:
		$Background.play("default")


func _on_game_button_pressed():
	Utils.change_scene_safely(Globals.PLACEHOLDER_SCENE_PATH)


func _on_options_button_pressed():
	Utils.change_scene_safely(Globals.PLACEHOLDER_SCENE_PATH)


func _on_quit_button_pressed():
	get_tree().quit()
