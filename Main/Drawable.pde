public class Drawable {
  protected int abstractX;
  protected int abstractY;
  protected int w;
  protected int h;
  protected float zAngle;
  protected int zIndex;
  protected PVector startPos;
  protected PVector endPos;
  protected PVector center;
  protected PVector scale;
  
  public void setup(int x, int y, int w, int h, int zIndex){
    this.abstractX = x;
    this.abstractY = y;
    this.w = w;
    this.h = h;
    this.zAngle = 0;
    this.zIndex = zIndex;

    this.startPos = new PVector(x, y);
    this.endPos = new PVector(x + w, y + h);
    this.center = new PVector(x + w/2, y + h/2);
    this.scale = new PVector(1, 1);
  }

  public int getX() { return abstractX; }
  public int getY() { return abstractY; }

  public void setPosition(int x, int y) {
    this.abstractX = x;
    this.abstractY = y;
  }

  public float getScaleX() { return scale.x; }
  public float getScaleY() { return scale.y; }

  public void setScale(float x, float y) {
    this.scale.x = x;
    this.scale.y = y;
  }

  public void rotate(float zAngle) {
    this.zAngle = zAngle;
  }

  // draw function
  public void draw(){
    System.out.println("Draw");
  }

  public void onClick(){
    System.out.println("Clicked");
  }
  
  public boolean mousePressed(){
    // System.out.println("Mouse Pressed"+ "||" + mouseX+ "||" + mouseY+ "||" + this.abstractX+ "||" + this.abstractY+ "||" + this.w+ "||" + this.h);
    if(
      mouseX > this.abstractX 
      && mouseX < this.abstractX + this.w
      && mouseY > this.abstractY 
      && mouseY < this.abstractY + this.h
    ){
      this.onClick();
      return true;
    } 
    return false;
  }
}