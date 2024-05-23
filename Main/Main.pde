int numPoints = 9;  // 점의 개수
float[] x = new float[numPoints];
float[] y = new float[numPoints];

void setup() {
  size(1280, 720);  // 캔버스 크기 설정
  float spacing = width / 8;  // 점 사이의 간격 계산
  
  // 점들의 좌표 설정 (지그재그 패턴)
  for (int i = 0; i < numPoints; i++) {
    x[i] = i * spacing + (width / 4);  // 점들을 중앙에 배치
    if (i % 2 == 0) {
      y[i] = height / 4;  // 짝수 번째 점의 y 좌표
    } else {
      y[i] = 3 * height / 4;  // 홀수 번째 점의 y 좌표
    }
    
    // x와 y 좌표를 작게 만들기
    x[i] = x[i] / 7.0 + 500;  // 오른쪽으로 이동
    y[i] = y[i] / 7.0 + 150;
  }
}

void draw() {
  background(255);  // 배경을 흰색으로 설정
  stroke(0);  // 선의 색을 검정색으로 설정
  fill(0);  // 점의 색을 검정색으로 설정
  
  // 점들과 선을 그림
  for (int i = 0; i < numPoints - 1; i++) {
    ellipse(x[i], y[i], 5, 5);  // 점을 작게 그림
    line(x[i], y[i], x[i + 1], y[i + 1]);  // 점들을 선으로 연결
  }
  // 마지막 점을 작게 그림
  ellipse(x[numPoints - 1], y[numPoints - 1], 5, 5);
  
  // 양 끝점에서 선을 꺾어서 연장함
  // 첫 번째 점에서 왼쪽으로 꺾인 선 연장
  line(x[0], y[0], x[0] - (width / 50), y[0] + (height / 20));  // 아래로 꺾어서 연장
  // 마지막 점에서 오른쪽으로 꺾인 선 연장
  line(x[numPoints - 1], y[numPoints - 1], x[numPoints - 1] + (width / 50), y[numPoints - 1] - (height / -40));  // 위로 꺾어서 연장
}