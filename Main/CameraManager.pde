// 화면 줌인 줌아웃 기능
final CameraManager cameraManager = new CameraManager();

public class CameraManager {
  PVector initialCenter;
  float initialZoom;

  PVector currentCenter; 
  float currentZoom;

  PVector targetCenter;
  float targetZoom;

  float zoomStartTime;
  float zoomDuration;

  CameraManager() {
    initialCenter = new PVector(0, 0);
    initialZoom = 1;

    currentCenter = new PVector(0, 0);
    currentZoom = 1;

    targetCenter = new PVector(0, 0);
    targetZoom = 1;

    zoomStartTime = 0;
    zoomDuration = 1000;
  }

  public void zoom(PVector center, float ratio) {
    // time 동안 center가 중점이 되며 ratio 비율로 확대된 줌을 수행합니다.
    // ratio가 2일 때 : 2배 확대
    targetCenter = center;
    targetZoom = ratio;
    zoomStartTime = millis();
  }

  public void zoom(PVector center, float ratio, float time) {
    // time 동안 center가 중점이 되며 ratio 비율로 확대된 줌을 수행합니다.
    // ratio가 2일 때 : 2배 확대
    targetCenter = center;
    targetZoom = ratio;
    zoomStartTime = millis();
    zoomDuration = time;
  }
  
  public void resetView() {
    targetCenter = initialCenter;
    targetZoom = initialZoom;
    zoomStartTime = millis();
  }

  public void resetView(float time) {
    targetCenter = initialCenter;
    targetZoom = initialZoom;
    zoomStartTime = millis();
    zoomDuration = time;
  }

  public void update() {
    float time = millis() - zoomStartTime;
    if (time < zoomDuration) {
      float t = time / zoomDuration;
      currentCenter.x = currentCenter.x + (targetCenter.x - currentCenter.x) * t;
      currentCenter.y = currentCenter.y + (targetCenter.y - currentCenter.y) * t;
      currentZoom = currentZoom + (targetZoom - currentZoom) * t;
    } else {
      // currentCenter = targetCenter;
      // currentZoom = targetZoom;
      resetView();
    }
  }

  public void apply() {
    translate(0, 0);
    scale(currentZoom);
    translate(-currentCenter.x, -currentCenter.y);
  }

  public void draw() {
    pushStyle();

    update();
    apply();
    
    popStyle();
  }
}
