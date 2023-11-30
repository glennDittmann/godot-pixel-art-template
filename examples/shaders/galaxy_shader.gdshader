shader_type canvas_item;

vec3 palette(float t) {
	vec3 a = vec3(0.5, 0.5, 0.5);
	vec3 b = vec3(0.5, 0.5, 0.5);
	vec3 c = vec3(1.0, 1.0, 1.0);
	vec3 d = vec3(0.263, 0.416, 0.557);
	
	return a + b * cos(6.28318 * (c * t + d));
}

// runs for every pixel of the associated sprite node
void fragment() {
	vec2 centered_uv = (UV - 0.5) * 2.0;
	
	centered_uv.x *= (TEXTURE_PIXEL_SIZE.x / TEXTURE_PIXEL_SIZE.y);
	
	vec2 centered_uv0 = centered_uv;
	
	vec3 final_col = vec3(0.0);
	
	for (float i = 0.0; i < 4.0; i++) {
		centered_uv *= 1.5;
		centered_uv = fract(centered_uv);
		centered_uv -= 0.5;
		
		float d = distance(UV.xy * TEXTURE_PIXEL_SIZE.xy, centered_uv) * exp(-length(centered_uv0));
		//float d = length(centered_uv);
		
		vec3 col_out = palette(length(centered_uv0) + (i + TIME * 4.0) * 0.4);
		
		d = sin(d * 8.0 + TIME * - 2.0)/8.0;
		
		d = abs(d);
		
		//d = smoothstep(0.0, 0.1, d);
		d = pow(0.01 / d, 2.2);
		
		final_col += col_out * d;
	}
	
	COLOR = vec4(final_col, 1.0);
}
