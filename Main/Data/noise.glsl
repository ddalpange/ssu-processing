uniform sampler2D tex;
uniform float time;
uniform vec2 resolution;

float random (in vec2 st) {
    return fract(sin(dot(st.xy,
                         vec2(12.9898,78.233)))
                 * 43758.5453123);
}

void main() {
    vec2 uv = gl_FragCoord.xy / resolution.xy;
    uv.y = 1.0 - uv.y;

    // Add noise
    float noise = random(uv * 1000.0 + time * 100);

    // Add flicker effect
    float flicker = pow(noise, 3.0);

    vec4 color = texture(tex, uv);
    color.a = 1;
    // Mix color with noise
    vec3 color2 = vec3(flicker);

    color.rgb -= color2;
    //color.r = 1;
    //color.g = 1;
    //color.b = 1;


    gl_FragColor = color;
}