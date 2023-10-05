extends Control

@export var SCENE_TO_LOAD: String = Globals.MAIN_MENU_SCENE_PATH

func _ready():
	$BackButton.grab_focus()

func _on_back_button_pressed():
	Utils.change_scene_safely(SCENE_TO_LOAD)
