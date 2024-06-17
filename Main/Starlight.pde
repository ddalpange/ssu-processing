public class Starlight extends Drawable {
  int numStars;
  float[] starX;
  float[] starY;
  float[] starBrightness;
  float[] starBrightnessChange;
  color[] starColor;

  public Starlight(int numStars, float[] starX, float[] starY, float[] starBrightness, float[] starBrightnessChange, color[] starColor) {
    super();
    this.numStars = numStars;
    this.starX = starX;
    this.starY = starY;
    this.starBrightness = starBrightness;
    this.starBrightnessChange = starBrightnessChange;
    this.starColor = starColor;
  }
  @Override
    public void draw() {
    pushStyle();
    for (int i = 0; i < this.numStars; i++) {
      // 밝기 변화량에 따라 밝기 조절
      this.starBrightness[i] += this.starBrightnessChange[i];
      if (this.starBrightness[i] > 255 || this.starBrightness[i] < 100) {
        this.starBrightnessChange[i] *= -1; // 밝기 변화 방향 반전
      }
      this.starBrightness[i] = constrain(this.starBrightness[i], 100, 255); // 밝기 범위 제한
      // 별의 밝기에 따라 색깔 조정 (노랑에서 하얀색으로 그라데이션)
      float t = map(this.starBrightness[i], 100, 255, 0, 1); // 밝기에 따른 보간 인자
      color starColor = lerpColor(color(0), color(255, 255, 255), t); // 노랑에서 하얀색으로
      drawStar(this.starX[i], this.starY[i], this.starBrightness[i]);
    }
    popStyle();
  }

  void drawStar(float x, float y, float brightness) {
    stroke(255, 255, 255, brightness);
    strokeWeight(2);
    // 십자가 모양
    line(x - 5, y, x + 5, y);
    line(x, y - 5, x, y + 5);
    // 마름모 모양
    line(x - 3.5, y - 3.5, x + 3.5, y + 3.5);
    line(x + 3.5, y - 3.5, x - 3.5, y + 3.5);
  }
}
