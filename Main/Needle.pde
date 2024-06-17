public class Needle extends Drawable {

  public Needle(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;

    pushStyle();
    pushMatrix(); // 변환을 저장
    noStroke();

    fill(#A2A2A2);
    triangle(abstractX+25, abstractY+202, abstractX+246, abstractY+44, abstractX+270, abstractY+100);
    ellipse(abstractX+258, abstractY+72, 62, 62);

    fill(#ffffff);
    ellipse(abstractX+258, abstractY+71, 21, 20);

    rotate(radians(-26));
    fill(#ffffff);
    ellipse(abstractX+126, abstractY+193, 96, 8);

    rotate(radians(0));
    fill(#ffffff);
    ellipse(abstractX+66, abstractY+193, 10, 6);
    popMatrix(); // 변환을 복구
    popStyle();
  }
}
