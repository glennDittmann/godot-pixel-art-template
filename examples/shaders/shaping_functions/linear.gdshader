shader_type canvas_item;

const vec3 RED = vec3(1.0, 0.0, 0.0);
const vec3 GREEN = vec3(0.0, 1.0, 0.0);
const vec3 BLUE = vec3(0.0, 0.0, 1.0);
const float exponent = 0.02;

// map UV from godot to glsl coordinate system, e.g. to follow tutorials more easily
// 1. (0,0) -> (0,1)
// 2. (0,1) -> (0,0)
// 3. (1,0) -> (1,1)
// 4. (1,1) -> (1,0)
// as you can see the x coordinate stays is the same in booth coordinate systems
// so the the mapping is just 0 -> 1 and 1 -> 0 for the y coordinate
vec2 mapUV(vec2 uv) {
	return vec2(uv.x, 1.0 - uv.y);
}


// plot a line on y using value from (0.0, 1.0)
float plot(vec2 uv) {
	return smoothstep(0.01, 0.0, abs(uv.y - uv.x));
}

float plot2(vec2 uv, float pct) {
	return smoothstep(pct - 0.02, pct, uv.y) - smoothstep(pct, pct + 0.02, uv.y);
}	

void fragment() {
	vec2 uv = mapUV(UV);
	float y = smoothstep(0.2,0.5,uv.x) - smoothstep(0.5,0.8,uv.x);
	vec3 background_color = vec3(y);
	// plot the line
	float pct = plot(uv);
	pct = plot2(uv, y);
	
	vec3 color = (1.0 - pct) * background_color + pct * GREEN;
	
	COLOR = vec4(color, 1.0);
}
