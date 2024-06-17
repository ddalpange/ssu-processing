public class Moon extends Drawable {

  public Moon(float x, float y, float size) {
    super(x + size / 2, y + size / 2, size, size);
  }

  @Override
  public void draw() {
    float abstractX = x;
    float abstractY = y;
    float abstractSize = w;

    pushStyle();
    // 기존 원
    fill(255, 216, 72, 255);
    ellipse(abstractX, abstractY, abstractSize, abstractSize);

    // 무늬
    fill(232, 184, 61, 200); 
    ellipse(abstractX + abstractSize * 0.37, abstractY, abstractSize * 0.12, abstractSize * 0.20); 
    ellipse(abstractX + abstractSize * 0.37, abstractY - abstractSize * 0.17, abstractSize * 0.067, abstractSize * 0.067);
    ellipse(abstractX + abstractSize * 0.37, abstractY + abstractSize * 0.17, abstractSize * 0.033, abstractSize * 0.033);
    ellipse(abstractX + abstractSize * 0.30, abstractY + abstractSize * 0.13, abstractSize * 0.067, abstractSize * 0.067);
    ellipse(abstractX - abstractSize * 0.37, abstractY - abstractSize * 0.13, abstractSize * 0.053, abstractSize * 0.053);
    ellipse(abstractX - abstractSize * 0.27, abstractY - abstractSize * 0.27, abstractSize * 0.08, abstractSize * 0.08);
    ellipse(abstractX - abstractSize * 0.33, abstractY - abstractSize * 0.20, abstractSize * 0.027, abstractSize * 0.027);
    ellipse(abstractX - abstractSize * 0.13, abstractY + abstractSize * 0.40, abstractSize * 0.053, abstractSize * 0.053);
    ellipse(abstractX - abstractSize * 0.20, abstractY + abstractSize * 0.40, abstractSize * 0.02, abstractSize * 0.02);
    ellipse(abstractX - abstractSize * 0.27, abstractY + abstractSize * 0.33, abstractSize * 0.04, abstractSize * 0.04);
    popStyle();
  }
}