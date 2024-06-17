public class HPBar extends Drawable {
  public int hp = 0;
  public int maxHp = 10;
  private float borderWith = 4;
  public HPBar(float x, float y) {
    super(x, y, 300, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;


    // 손잡이
    pushStyle();
    pushMatrix();
    // fill(#DD9A5E);
    stroke(#DD9A5E);
    strokeWeight(borderWith);
    translate(abstractX, abstractY);
    rotate(radians(zAngle));
    // 안쪽 radius가 안먹어서 수정, radius 필요할 시 한번 더 감싸는게 나을지도 .. 
    rect(0, 0, w, h);
    popMatrix();
    popStyle();

    pushStyle();
    pushMatrix();
    noStroke();
    fill(200, 0, 0);
    strokeWeight(2);
    translate(abstractX, abstractY);
    rotate(radians(zAngle));
    // stoke가 inside, outisde 반반으로 먹음. 
    float buffer = borderWith / 2;
    rect(buffer, buffer, w * (float)hp / maxHp - buffer, h - buffer);
    popMatrix();
    popStyle();

    
  }
}
