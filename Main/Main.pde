// 이벤트 함수는 모두 이 파일에서 정의한다. 같은 이벤트 함수를 여러 파일에서 정의할 수 없기 때문이다.
// 전역 변수도 이 파일에서 정의한다.

import static java.awt.event.KeyEvent.*;
float deltaTime = 0;
int lastMillis = 0;

void setup() {
  size(1280, 720, P2D);
  println("setup");
  sceneManager.loadScene(new Scene_Intro());
  postProcessManager.addGrain(new PVector(0.3, 0.6, 0.3));
}

void draw() {
  updateDeltaTime();

  background(255);
  BaseScene scene = sceneManager.getCurrentScene();

  cameraManager.draw(); 
  
  if (scene != null) {
    scene.draw();
  }

  postProcessManager.draw();
  image(get(), 0, 0, width, height);
}

void updateDeltaTime() {
  int currentMillis = millis();
  deltaTime = (currentMillis - lastMillis) / 1000.0;
  lastMillis = currentMillis;
}

void mousePressed() {
  BaseScene scene = sceneManager.getCurrentScene();
  if (scene != null) {
    scene.mousePressed();
  } else {
    println("scene is null!");
  }
}


void keyPressed() {

  // Temporal test code for return to IntroScene
  if (keyCode == VK_F1) {
    sceneManager.loadScene(new Scene_Intro());
  }
}
