public class Button {
  public Button() {

  }

  public Button(String text, PVector position, PVector size) {
    this.text = text;
    this.position = position;
    this.size = size;
  }

  public Button(PVector position, PVector size, PImage image) {
    this.position = position;
    this.size = size;
    this.image = image;
  }

  public String text;
  public color buttonColor = #FFFFFF;
  public color textColor = #000000;
  public int fontSize = 24;
  // TODO: text font and size
  // Left top of the button 
  public PVector position;
  // Size of the button(rect size)
  public PVector size;
  public PImage image;
  
  public boolean drawAndCheckClick() {
    pushStyle();
    
    draw();
    
    popStyle();

    return isMouseOver() && mouseClickedThisFrame;
  }
  
  public boolean isMouseOver() {
    float posX = position.x;
    float posY = position.y;
    float sizeX = size != null ? size.x : image.width;
    float sizeY = size != null ? size.y : image.height;
    if (image != null) {
      posX -= sizeX / 2;
      posY -= sizeY / 2;
    } else {

    }
      return mouseX > posX && mouseX < posX + sizeX && mouseY > posY && mouseY < posY + sizeY;
  }
  
  public void draw() {
    pushStyle();
    
    noStroke();
    int fontSize = getMouseOverFontSize(isMouseOver());
    fill(buttonColor);
    float sizeX = size != null ? size.x : image.width;
    float sizeY = size != null ? size.y : image.height;
    if (image != null) {
      shapeMode(CENTER);
      image(image, position.x - sizeX / 2, position.y - sizeY / 2, sizeX, sizeY);
    } else {
      rect(position.x, position.y, size.x, size.y);
    }
    if (text != null) {
      float textX;
      float textY;
      if (image != null) {
        textX = position.x;
        textY = position.y;
      } else {
        textX = position.x + sizeX / 2;
        textY = position.y + sizeY / 2;
      }
      textAlign(CENTER, CENTER);
      fontManager.drawText(text, (int)textX, (int)textY, fontSize);
    }
    popStyle();
  }
  
  // Can be overriden in the derived class
  protected void setMouseOverStyle(boolean isOver) {
    if (isOver) {
      strokeWeight(2);
    }
    else {
      strokeWeight(1);
    }
  }

  int getMouseOverFontSize(boolean isOver) {
    if (isOver) {
      return (int)(fontSize * 1.2);
    }
    else {
      return fontSize;
    }
  }
}
