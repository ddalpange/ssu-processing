uniform sampler2D tex; // 입력 텍스쳐
uniform vec2 resolution; // 화면 해상도
uniform float time;   // 시간 값

void main() {
    vec2 uv = gl_FragCoord.xy / resolution;
    uv.y = 1.0 - uv.y;

    vec4 originalColor = texture(tex, uv);

    // add more red
    vec4 finalColor = originalColor;
    finalColor.r += sin(time);
    finalColor.b += cos(time);

    // 출력 색상 설정
    gl_FragColor = finalColor;
}
