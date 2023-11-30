extends Sprite2D


func _on_button_pressed():
	print("HIT")
	#$tree/AnimationPlayer.play("tree_shader")
	material.set_shader_parameter("alpha", 0.2)
	$Timer.start()


func _on_timer_timeout():
	material.set_shader_parameter("alpha", 1.0)
