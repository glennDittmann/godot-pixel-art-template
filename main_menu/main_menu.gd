extends Control


func _ready():
	$VBoxContainer/GameButton.grab_focus()


func _process(delta):
	_update_background()


func _update_background():
	if $VBoxContainer/GameButton.is_hovered() or $VBoxContainer/GameButton.has_focus():
		$Background.play("game")
	elif $VBoxContainer/OptionsButton.is_hovered() or $VBoxContainer/OptionsButton.has_focus():
		$Background.play("options")
	elif $VBoxContainer/QuitButton.is_hovered() or $VBoxContainer/QuitButton.has_focus():
		$Background.play("quit")
	else:
		$Background.play("default")


func _on_game_button_pressed():
	Utils.change_scene_safely(Globals.PLACEHOLDER_SCENE_PATH)


func _on_options_button_pressed():
	Utils.change_scene_safely(Globals.PLACEHOLDER_SCENE_PATH)


func _on_quit_button_pressed():
	get_tree().quit()
