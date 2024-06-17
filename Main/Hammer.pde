public class Hammer extends Drawable {

  public Hammer(float x, float y) {
    super(x, y, 300, 150);
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
    rect(w / 2, h / 2, w, h * 0.22, 30);
    popMatrix();
    popStyle();

    // 머리    
    pushStyle();
    pushMatrix();
    fill(#DD9A5E);
    noStroke();
    translate(abstractX, abstractY);
    rotate(radians(zAngle));
    rectMode(CENTER); 
    rect(w * 0.8, h / 2, w * 0.2, h, 20);
    popMatrix();
    popStyle();
  }
}
