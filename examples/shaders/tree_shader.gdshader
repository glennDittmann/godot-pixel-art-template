shader_type canvas_item;

uniform float alpha = 1.0;

void fragment() {
	vec4 curr_color = texture(TEXTURE, UV); // get color of current pixel
	COLOR = vec4(curr_color.zyx, alpha);
}
