public class Button2 extends ShapeObject {
  public String text;
  public PVector textOffset;
  public int fontSize = 24;
  public Button2(PImage image, float x, float y) {
    super(image);
    setPosition(x, y);
  }

  public Button2(PImage image, String text, int fontSize, float x, float y) {
    super(image);
    setPosition(x, y);
    this.text = text;
    this.fontSize = fontSize;
  }

  public boolean isClicked() {
    return isMouseOver() && mouseClickedThisFrame;
  }

  @Override
  public void draw() {
    super.draw();
    pushStyle();

    if (text != null) {
      float textX = x;
      if (textOffset != null)
        textX += textOffset.x;
      float textY = y;
      if (textOffset != null)
        textY += textOffset.y;
      textAlign(CENTER, CENTER);
      fontManager.drawText(text, (int)textX, (int)textY, fontSize);
    }

    popStyle();
  }
}