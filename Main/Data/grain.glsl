uniform vec3 col;
uniform sampler2D tex;
uniform float time;
uniform vec2 resolution;

void main() {
    float amount = 0.1;

    vec2 uv = gl_FragCoord.xy / resolution;
    uv.y = 1.0 - uv.y;

    // Calculate noise and sample texture
    float mdf = 0.2; // increase for noise amount
    float speed = 6;
    float noise = (fract(sin(dot(uv, vec2(12.9898,78.233)*2.0)) * 43758.5453 + time * speed));
    vec4 tColor = texture(tex, uv);
    
    //mdf *= sin(time) + 1.0; // animate the effect's strength
    
    //vec4 subtractedColor = vec4(0, 1, 1, 1);
    vec4 subtractedColor = vec4(1 - col.r, 1 - col.g, 1 - col.b, 1);
    vec4 finalColor = tColor - (subtractedColor * noise * mdf);
    //vec4 col = mix(tColor, (grainColor * noise * mdf), amount);

    // Output to screen
    gl_FragColor = finalColor;
}
