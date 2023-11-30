extends Sprite2D

var blue_val = 0.5

#material.set_shader_parameter("blue", blue_val)

# Called when the node enters the scene tree for the first time.
func _ready():
	material.set_shader_parameter("blue", blue_val)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
