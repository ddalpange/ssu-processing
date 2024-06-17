public class Axe extends Drawable {

  public Axe(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
  float abstractX = x;
  float abstractY = y;

  // 손잡이
  pushStyle();
  pushMatrix();
  fill(#DD9A5E);
  noStroke();
  translate(abstractX, abstractY);
  rotate(radians(zAngle));
  rectMode(CENTER);
  rect(abstractX+5, abstractY+-78, 274, 44, 30);
  popMatrix();
  popStyle();

// 도끼 머리
  pushStyle();
  pushMatrix();
  fill(#6C6E6E);
  noStroke();
  translate(abstractX, abstractY);
  rotate(radians(zAngle));
  quad(abstractX-116, abstractY+10, abstractX-93, abstractY-119, abstractX-46, abstractY-124, abstractX+-12, abstractY+1);
  popMatrix();
  popStyle();
  

  // 도끼 머리 하이라이트
  pushStyle();
  pushMatrix();
  stroke(175, 173, 169);
  strokeWeight(23);
  noFill();
  curveTightness(0.6);
  translate(abstractX, abstractY);
  rotate(radians(zAngle));
  beginShape();
  curveVertex(abstractX-494, abstractY - 80);
  curveVertex(abstractX-107, abstractY +10);
  curveVertex(abstractX-22, abstractY + -2);
  curveVertex(abstractX+284, abstractY -218);
  endShape();
  popMatrix();
  popStyle();
  }
}
