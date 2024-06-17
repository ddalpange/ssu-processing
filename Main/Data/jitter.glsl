// 기본 셰이더 코드
uniform sampler2D tex; // 입력 텍스쳐
uniform float time;   // 시간 값
uniform vec2 resolution; // 화면 해상도

// 픽셀 색상을 계산하는 함수
vec4 applyJitter(vec2 uv) {
    // 무작위 노이즈 값을 생성하기 위한 임의의 시드
    float seed = 1234.0;
    
    // 노이즈 효과에 사용될 값들
    float jitterAmount = 0.005; // 지지직거리는 정도를 조절합니다.
    //float time = 0.0; // 시간 값

    // 지지직거리는 효과를 위해 UV 좌표에 임의의 노이즈를 더합니다.
    float speed = 10;
    vec2 jitterUV = uv + vec2(
        cos(seed + uv.y * 100.0 + time * speed) * jitterAmount,
        sin(seed + uv.x * 100.0 + time * speed) * jitterAmount
    );

    // 노이즈가 추가된 UV 좌표에서 텍스처 샘플링을 수행합니다.
    vec4 color = texture(tex, jitterUV);

    return color;
}

void main() {
    // 현재 픽셀의 UV 좌표
    vec2 uv = gl_FragCoord.xy / resolution;
    uv.y = 1.0 - uv.y;

    // 픽셀 색상 계산
    vec4 finalColor = applyJitter(uv);

    // 출력 색상 설정
    gl_FragColor = finalColor;
}
