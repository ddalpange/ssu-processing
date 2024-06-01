public class Button {
  public Button() {

  }

  public Button(String text, PVector position, PVector size) {
    this.text = text;
    this.position = position;
    this.size = size;
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
  
  public boolean drawAndCheckClick() {
    pushStyle();
    
    draw();
    
    popStyle();

    return isMouseOver() && mouseClickedThisFrame;
  }
  
  public boolean isMouseOver() {
    return mouseX > position.x && mouseX < position.x + size.x && mouseY > position.y && mouseY < position.y + size.y;
  }
  
  public void draw() {
    pushStyle();
    
    setMouseOverStyle(isMouseOver());  
    fill(buttonColor);
    rect(position.x, position.y, size.x, size.y);
    if (text != null) {
      float textX = position.x + size.x / 2;
      float textY = position.y + size.y / 2;
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
}
