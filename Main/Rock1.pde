public class Rock1 extends Drawable {
  public float hp = 10;
  private float borderWith = 4;
  private color c;
  public Rock1(float x, float y, color c) {
    super(x, y, 60, 60);
    this.c = c;
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;


    // 손잡이
    pushStyle();
    pushMatrix();
    translate(abstractX, abstractY);
    rotate(radians(zAngle));
    beginShape();
    fill(c);
    vertex(
      w / 100 * 20, 
      h / 100 * 15
    );
    vertex(
      w / 100 * 40, 
      h / 100 * 7
    );
    vertex(
      w / 100 * 60,
      h / 100 * 7
    );
    vertex(
      w / 100 * 70,
      h / 100 * 15
    );
    vertex(
      w / 100 * 80,
      h / 100 * 40
    );
  
    vertex(
      w / 100 * 70,
      h / 100 * 45
    );
    vertex(
      w / 100 * 20,
      h / 100 * 45
    );
    vertex(
      w / 100 * 10,
      h / 100 * 35
    );
    endShape(CLOSE);
      popMatrix();
      popStyle();
    }
}
