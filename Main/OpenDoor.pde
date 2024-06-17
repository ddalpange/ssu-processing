public class OpenDoor extends Drawable {
  public OpenDoor(float x, float y) {
    super(x, y, 100, 100);
  }
  @Override
  public void draw() {
  float x1 = 150 + 5 + x;
  float y1 = -250 +1 + y;
  float x2 = 300 + 5 + x;
  float y2 = -190 +1 + y;
  float x3 = 300 + 5 + x;
  float y3 = 310 + 1 + y;
  float x4 = 150 + 5 + x;
  float y4 = 250 + 1 + y;

    pushStyle();
    // translate(x, y);
    drawDoorBackground(x1, y1, x2, y2, x3, y3, x4, y4);
    drawFrame(x, y);
    drawInside(x, y);
    drawOpenDoor(x1, y1, x2, y2, x3, y3, x4, y4, 6);
    popStyle();
  }

  void drawFrame(float x, float y) {
    pushStyle();
    stroke(#964b00);
    strokeWeight(6);
    noFill();
    rectMode(CENTER);
    rect(x, y, 300, 500);
    popStyle();
  }
  void drawOpenDoor(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, int numDiv) {
    pushStyle();
    stroke(#b4773b);
    strokeWeight(4);
    for (int i = 1; i < numDiv; i++) {
      float xLerp1 = lerp(x1, x4, i / (float)numDiv);
      float yLerp1 = lerp(y1, y4, i / (float)numDiv);
      float xLerp2 = lerp(x2, x3, i / (float)numDiv);
      float yLerp2 = lerp(y2, y3, i / (float)numDiv);
      line(xLerp1, yLerp1, xLerp2, yLerp2);
    }
    for (int i = 1; i < numDiv; i++) {
      float xLerp1 = lerp(x1, x2, i / (float)numDiv);
      float yLerp1 = lerp(y1, y2, i / (float)numDiv);
      float xLerp2 = lerp(x4, x3, i / (float)numDiv);
      float yLerp2 = lerp(y4, y3, i / (float)numDiv);
      line(xLerp1, yLerp1, xLerp2, yLerp2);
    }
    stroke(#964b00);
    strokeWeight(2);
    beginShape();
    strokeWeight(6);
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    vertex(x4, y4);
    endShape(CLOSE);
    fill(#eeeeee);
    strokeWeight(6);
    stroke(#964b00);
    ellipse(x1 + 125, (y1 + y4 + 115) / 2, 20, 20);
    popStyle();
  }
  void drawDoorBackground(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
    pushStyle();
    beginShape();
    fill(#eeeeee);
    vertex(x1, y1);
    vertex(x2, y2);
    vertex(x3, y3);
    vertex(x4, y4);
    endShape(CLOSE);
    popStyle();
  }
  void drawInside(float x, float y) {
    noFill();
    stroke(#b4773b);
    strokeWeight(8);
    rectMode(CENTER);
    rect(x, y, 290, 490);
  }
}
