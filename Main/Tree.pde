public class Tree extends Drawable {

  public Tree(float x, float y) {
    super(x, y, 100, 100);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;

    pushStyle();
    noStroke();
    fill(abstractX+139, 69, 19);
    triangle(abstractX+233, abstractY+323, abstractX+195, abstractY+176, abstractX+158, abstractY+323);
    
    fill(#337833);
    ellipse(abstractX+119, abstractY+213, 125, 110);
    ellipse(abstractX+192, abstractY+182, 120, 120);
    ellipse(abstractX+257, abstractY+204, 125, 110);
    
    fill(62, 175, 62);
    ellipse(abstractX+118, abstractY+197, 120, 120);
    ellipse(abstractX+196, abstractY+168, 130, 130);
    ellipse(abstractX+262, abstractY+186, 120, 119);
    
    fill(88, 211, 88);
    ellipse(abstractX+106, abstractY+170, 150, 150);
    ellipse(abstractX+191, abstractY+125, 188, 195);
    ellipse(abstractX+275, abstractY+163, 148, 151);

    popStyle();
  }
}
