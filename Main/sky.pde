public class Sky extends Drawable {

  public Sky(float x, float y, float w, float h) {
    super(x, y, w, h);
  }

  @Override
  public void draw() {
    noStroke();
    beginShape();
    fill(249, 252, 158, 180);
    vertex(x + 396, y + 56);
    vertex(x + 284, y + 126);
    vertex(x + 292, y + 166);
    vertex(x + 417, y + 74);
    endShape(CLOSE);
    
    beginShape();
    fill(249, 252, 158, 180);
    vertex(x + 462, y + 109);
    vertex(x + 417, y + 176);
    vertex(x + 441, y + 198);
    vertex(x + 492, y + 133);
    endShape(CLOSE);
    
    beginShape();
    fill(249, 252, 158, 180);
    vertex(x + 556, y + 152);
    vertex(x + 532, y + 307);
    vertex(x + 563, y + 313);
    vertex(x + 586, y + 158);
    endShape(CLOSE);
    
    beginShape();
    fill(249, 252, 158, 180);
    vertex(x + 666, y + 144);
    vertex(x + 704, y + 266);
    vertex(x + 740, y + 235);
    vertex(x + 692, y + 134);
    endShape(CLOSE);
    
    beginShape();
    fill(249, 252, 158, 180);
    vertex(x + 750, y + 91);
    vertex(x + 864, y + 261);
    vertex(x + 906, y + 248);
    vertex(x + 778, y + 74);
    endShape(CLOSE);
    
    beginShape();
    fill(249, 252, 158, 180);
    vertex(x + 818, y + 57);
    vertex(x + 909, y + 133);
    vertex(x + 938, y + 114);
    vertex(x + 838, y + 34);
    endShape(CLOSE);
  }
}
