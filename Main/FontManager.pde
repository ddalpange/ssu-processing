public final FontManager fontManager = new FontManager();

public class FontManager {
  private PFont font;
  private color defaultColor = #000000;

  public FontManager() {
    
  }
  
  public void setup() {
    font = createFont("res/Font/NanumBarunGothic.otf", 20);
    //font = loadFont("res/Font/NanumBarunGothic.otf");
  }
  
  
  public void drawText(String text, int x, int y, int size) {
    pushStyle();

    fill(defaultColor);
    textFont(font, size);
    text(text, x, y);

    popStyle();
  }

  public void drawText(String text, float x, float y, float width, float height, int size) {
    pushStyle();

    fill(defaultColor);
    textFont(font, size);
    text(text, x, y, width, height);

    popStyle();
  }
}
